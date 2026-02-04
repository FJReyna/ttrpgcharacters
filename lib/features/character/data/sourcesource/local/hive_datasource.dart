import 'package:hive_ce/hive.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:uuid/uuid.dart';

class CharacterHiveDatasource {
  late Box<CharacterModel> _charactersBox;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(CharacterModelAdapter().typeId)) {
      Hive.registerAdapter(CharacterModelAdapter());
    }

    _charactersBox = await Hive.openBox<CharacterModel>('characters');
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    return _charactersBox.values.toList();
  }

  Future<CharacterModel?> getCharacterById(String id) async {
    return _charactersBox.get(id);
  }

  Future<CharacterModel> saveCharacter(CharacterModel character) async {
    await _charactersBox.put(character.id, character);
    return character;
  }

  Future<void> deleteCharacter(String id) async {
    await _charactersBox.delete(id);
  }

  Future<void> close() async {
    await _charactersBox.close();
  }

  Future<void> seedInitialData() async {
    if (_charactersBox.isEmpty) {
      final CharacterModel initialCharacter = CharacterModel(
        id: getIt<Uuid>().v7(),
        name: 'Aecian',
        characterClass: 'Wizard',
        ancestry: 'Astral Elf',
        system: 'D&D 5e',
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );
      await saveCharacter(initialCharacter);
    }
  }
}
