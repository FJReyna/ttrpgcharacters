import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_modules_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getAllCharacters();
  Future<bool> createCharacter(CharacterModel character);
  Future<CharacterModel> getCharacterById(String id);
  Future<CharacterModulesModel> getCharacterModules(String characterId);
  Future<void> deleteCharacter(String id);
}
