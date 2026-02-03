import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';

class CharacterLocalDatasource {
  Future<List<CharacterModel>> getAllCharacters() async {
    return [
      CharacterModel(id: '1', name: 'Hero'),
      CharacterModel(id: '2', name: 'Villain'),
    ];
  }

  Future<CharacterModel> createCharacter(CharacterModel character) async {
    // TODO: Implement local storage logic
    return character;
  }
}
