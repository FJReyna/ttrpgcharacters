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

class CharactersPages extends StatefulWidget {
  const CharactersPages({super.key});

  @override
  State<CharactersPages> createState() => _CharactersPagesState();
}

class _CharactersPagesState extends State<CharactersPages> {
  final ScrollController _scrollController = ScrollController();
  bool _isFABVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateShowFAB);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateShowFAB() {
    if (!_scrollController.hasClients) return;
    final double extentAfter = _scrollController.position.extentAfter;
    final bool shouldShow = extentAfter != 0.0;
    if (_isFABVisible != shouldShow) {
      setState(() {
        _isFABVisible = shouldShow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CharacterBloc>()..add(GetCharactersEvent()),
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _updateShowFAB();
          });
          return Scaffold(
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
                child: _buildBodyContent(context, state),
              ),
            ),
            floatingActionButton: _isFABVisible
                ? FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add, color: AppColors.surfaceLight),
                  )
                : null,
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
          );
        },
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context, CharacterState state) {
    if (state.status == CharacterStatus.loading) {
      return const CircularProgressIndicator();
    } else if (state.status == CharacterStatus.success) {
      final itemCount = state.characters.length + 1;
      if (state.characters.isEmpty) {
        return const CharacterEmptySlot();
      }
      return ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index < state.characters.length) {
            final character = state.characters[index];
            return CharacterCardPreview(character: character);
          } else {
            return CharacterEmptySlot();
          }
        },
      );
    } else if (state.status == CharacterStatus.error) {
      return Text(context.translate.charactersFailedState);
    } else {
      return const SizedBox.shrink();
    }
  }
}
