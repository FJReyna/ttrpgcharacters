import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';
import 'package:ttrpgcharacter/core/utils/extensions.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_bloc.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_event.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_state.dart';

class CharactersPages extends StatelessWidget {
  const CharactersPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CharacterBloc>()..add(GetCharactersEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text(context.translate.charactersAppbarTitle)),
        body: Center(
          child: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
              if (state.status == CharacterStatus.loading) {
                return const CircularProgressIndicator();
              } else if (state.status == CharacterStatus.success) {
                if (state.characters.isEmpty) {
                  return const Text('No characters found.');
                }
                return ListView.builder(
                  itemCount: state.characters.length,
                  itemBuilder: (context, index) {
                    final character = state.characters[index];
                    return ListTile(
                      title: Text(character.name),
                      subtitle: Text('Level: ${character.id}'),
                    );
                  },
                );
              } else if (state.status == CharacterStatus.error) {
                return const Text('Failed to load characters.');
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
