import 'package:ttrpgcharacter/features/character/domain/model/character_modules_model.dart';
import 'package:ttrpgcharacter/features/character/domain/repository/character_repository.dart';

class GetCharacterModules {
  final CharacterRepository repository;

  GetCharacterModules(this.repository);

  Future<CharacterModulesModel> call(String characterId) async {
    return await repository.getCharacterModules(characterId);
  }
}
