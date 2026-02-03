import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/repository/character_repository.dart';

class CreateCharacter {
  final CharacterRepository repository;

  CreateCharacter(this.repository);

  Future<CharacterModel> call(CharacterModel character) async {
    return await repository.createCharacter(character);
  }
}
