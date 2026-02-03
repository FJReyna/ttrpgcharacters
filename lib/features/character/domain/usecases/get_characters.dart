import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/repository/character_repository.dart';

class GetCharacters {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  Future<List<CharacterModel>> call() async {
    return await repository.getAllCharacters();
  }
}
