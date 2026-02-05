import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/repository/character_repository.dart';

class GetCharacter {
  final CharacterRepository repository;

  GetCharacter(this.repository);

  Future<CharacterModel> call(String id) async {
    return await repository.getCharacterById(id);
  }
}
