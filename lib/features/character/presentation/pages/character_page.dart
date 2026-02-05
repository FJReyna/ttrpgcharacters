import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';
import 'package:ttrpgcharacter/core/utils/extensions.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_bloc.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_event.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_state.dart';
import 'package:ttrpgcharacter/features/character/presentation/widgets/character_no_modules.dart';

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
      final character = state.character;
      final modules = state.modules;

      if (modules!.modules.isEmpty) {
        return CharacterNoModules();
      } else {
        return Column(children: [Text('Name: ${character?.name}')]);
      }
    } else {
      return SizedBox.shrink();
    }
  }
}
