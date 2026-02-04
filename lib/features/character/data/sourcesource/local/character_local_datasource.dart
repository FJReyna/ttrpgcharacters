import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';

class CharacterLocalDatasource {
  Future<List<CharacterModel>> getAllCharacters() async {
    return [
      CharacterModel(
        id: '1',
        name: 'Valeros',
        characterClass: 'Fighter',
        ancestry: 'Human',
        system: 'D&D 5e',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      /*CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),
      CharacterModel(
        id: '2',
        name: 'Jester',
        characterClass: 'Rogue',
        ancestry: 'Elf',
        system: 'Pathfinder 2e',
      ),*/
    ];
  }

  Future<CharacterModel> createCharacter(CharacterModel character) async {
    // TODO: Implement local storage logic
    return character;
  }
}
