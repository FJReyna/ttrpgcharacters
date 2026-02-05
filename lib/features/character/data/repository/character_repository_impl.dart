import 'package:ttrpgcharacter/features/character/data/sourcesource/local/hive_datasource.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_modules_model.dart';
import 'package:ttrpgcharacter/features/character/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  //final CharacterLocalDatasource _localDatasource;
  final CharacterHiveDatasource _localDatasource;

  CharacterRepositoryImpl(this._localDatasource);

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    await Future.delayed(const Duration(seconds: 2));
    return await _localDatasource.getAllCharacters();
  }

  @override
  Future<bool> createCharacter(CharacterModel character) async {
    return await _localDatasource.saveCharacter(character);
  }

  @override
  Future<CharacterModel> getCharacterById(String id) async {
    final CharacterModel? character = await _localDatasource.getCharacterById(
      id,
    );
    if (character != null) {
      return character;
    } else {
      throw Exception('Character not found');
    }
  }

  @override
  Future<CharacterModulesModel> getCharacterModules(String characterId) async {
    final CharacterModulesModel? modules = await _localDatasource
        .getCharacterModules(characterId);
    if (modules != null) {
      return modules;
    } else {
      throw Exception('Character modules not found');
    }
  }

  @override
  Future<void> deleteCharacter(String id) async {
    await _localDatasource.deleteCharacter(id);
  }
}
