import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';
import 'package:ttrpgcharacter/core/theme/app_colors.dart';
import 'package:ttrpgcharacter/core/utils/extensions.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_bloc.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_event.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_state.dart';
import 'package:ttrpgcharacter/features/character/presentation/widgets/character_card_preview.dart';
import 'package:ttrpgcharacter/features/character/presentation/widgets/character_empty_slot.dart';

class CharactersPages extends StatelessWidget {
  const CharactersPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CharacterBloc>()..add(GetCharactersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.translate.charactersAppbarTitle),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Chip(
                    label: Text('All'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Chip(
                    label: Text('D&D 5e'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Chip(
                    label: Text('Pathfinder 2e'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Chip(
                    label: Text('Pathfinder 2e'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Chip(
                    label: Text('Pathfinder 2e'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Chip(
                    label: Text('Pathfinder 2e'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Chip(
                    label: Text('Pathfinder 2e'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Chip(
                    label: Text('Pathfinder 2e'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 5.0,
            ),
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state.status == CharacterStatus.loading) {
                  return const CircularProgressIndicator();
                } else if (state.status == CharacterStatus.success) {
                  if (state.characters.isEmpty) {
                    return Text(context.translate.charactersEmptyState);
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: state.characters.length,
                    itemBuilder: (context, index) {
                      final character = state.characters[index];

                      if (index >= state.characters.length - 1) {
                        return Column(
                          children: [
                            CharacterCardPreview(character: character),
                            SizedBox(height: 10),
                            const CharacterEmptySlot(),
                          ],
                        );
                      }
                      return CharacterCardPreview(character: character);
                    },
                  );
                } else if (state.status == CharacterStatus.error) {
                  return Text(context.translate.charactersFailedState);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add, color: AppColors.surfaceLight),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: SizedBox(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.house),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.bookOpen),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.diceSix),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.gear),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
