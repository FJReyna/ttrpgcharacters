import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getAllCharacters();
  Future<CharacterModel> createCharacter(CharacterModel character);
}
