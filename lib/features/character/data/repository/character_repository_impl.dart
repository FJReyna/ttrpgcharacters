import 'package:ttrpgcharacter/features/character/data/sourcesource/local/hive_datasource.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
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
  Future<CharacterModel> createCharacter(CharacterModel character) async {
    return await _localDatasource.saveCharacter(character);
  }
}
