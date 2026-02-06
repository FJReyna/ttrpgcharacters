import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';
import 'package:ttrpgcharacter/core/utils/extensions.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_bloc.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_event.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_state.dart';
import 'package:ttrpgcharacter/features/character/presentation/widgets/character_no_modules.dart';
import 'package:ttrpgcharacter/features/module/domain/model/integer_module_data.dart';
import 'package:ttrpgcharacter/features/module/domain/model/module_model.dart';
import 'package:ttrpgcharacter/features/module/domain/model/text_module_data.dart';
import 'package:ttrpgcharacter/features/module/domain/model/tracker_module_data.dart';
import 'package:ttrpgcharacter/features/module/presentation/widgets/integer_module.dart';
import 'package:ttrpgcharacter/features/module/presentation/widgets/text_module.dart';
import 'package:ttrpgcharacter/features/module/presentation/widgets/tracker_module.dart';

class CharacterPage extends StatelessWidget {
  final String id;

  const CharacterPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CharacterBloc>()..add(GetCharacterEvent(id: id)),
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state.status == CharacterStatus.loading
                    ? context.translate.characterLoading
                    : state.status == CharacterStatus.success
                    ? state.character!.name
                    : '',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildCharacterDetails(context, state),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCharacterDetails(BuildContext context, CharacterState state) {
    if (state.status == CharacterStatus.loading) {
      return Center(child: CircularProgressIndicator());
    } else if (state.status == CharacterStatus.error) {
      return Text('Error: ${state.errorMessage}');
    } else if (state.status == CharacterStatus.success) {
      final modules = state.modules;

      if (modules!.modules.isEmpty) {
        return CharacterNoModules();
      } else {
        return ListView.builder(
          itemCount: modules.modules.length,
          itemBuilder: (context, index) {
            final module = modules.modules[index];
            return LayoutBuilder(
              builder: (context, constraints) {
                final moduleWidget = _buildModule(module.type, module);
                final moduleFeedback = Material(
                  color: Colors.transparent,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                    child: Opacity(
                      opacity: 0.7,
                      child: _buildModule(module.type, module),
                    ),
                  ),
                );

                return Draggable(feedback: moduleFeedback, child: moduleWidget);
              },
            );
          },
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildModule(ModuleType type, ModuleModel module) {
    switch (type) {
      case ModuleType.text:
        return TextModule(
          title: module.title,
          data: TextModuleData.fromJson(module.data),
        );
      case ModuleType.tracker:
        return TrackerModule(
          title: module.title,
          data: TrackerModuleData.fromJson(module.data),
        );
      case ModuleType.integer:
        return IntegerModule(
          title: module.title,
          data: IntegerModuleData.fromJson(module.data),
        );
    }
  }
}
