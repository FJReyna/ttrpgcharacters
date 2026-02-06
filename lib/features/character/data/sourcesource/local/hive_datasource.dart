import 'package:hive_ce/hive.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_modules_model.dart';
import 'package:ttrpgcharacter/features/module/domain/model/module_model.dart';
import 'package:uuid/uuid.dart';

class CharacterHiveDatasource {
  late Box<CharacterModel> _charactersBox;
  late Box<CharacterModulesModel> _characterModulesBox;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(CharacterModelAdapter().typeId)) {
      Hive.registerAdapter(CharacterModelAdapter());
    }

    if (!Hive.isAdapterRegistered(CharacterModulesModelAdapter().typeId)) {
      Hive.registerAdapter(CharacterModulesModelAdapter());
    }

    if (!Hive.isAdapterRegistered(ModuleModelAdapter().typeId)) {
      Hive.registerAdapter(ModuleModelAdapter());
    }

    if (!Hive.isAdapterRegistered(ModuleTypeAdapter().typeId)) {
      Hive.registerAdapter(ModuleTypeAdapter());
    }

    _charactersBox = await Hive.openBox<CharacterModel>('characters');
    _characterModulesBox = await Hive.openBox<CharacterModulesModel>(
      'character_modules',
    );
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    return _charactersBox.values.toList();
  }

  Future<CharacterModel?> getCharacterById(String id) async {
    return _charactersBox.get(id);
  }

  Future<bool> saveCharacter(CharacterModel character) async {
    try {
      await _charactersBox.put(character.id, character);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveCharacterModules(CharacterModulesModel modules) async {
    try {
      await _characterModulesBox.put(modules.characterId, modules);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> deleteCharacter(String id) async {
    await _charactersBox.delete(id);
    await _characterModulesBox.delete(id);
  }

  Future<CharacterModulesModel?> getCharacterModules(String id) async {
    return _characterModulesBox.get(id);
  }

  Future<void> close() async {
    await _charactersBox.close();
    await _characterModulesBox.close();
  }

  Future<void> clear() async {
    await _charactersBox.clear();
    await _characterModulesBox.clear();
  }

  Future<void> seedInitialData() async {
    final String characterId = getIt<Uuid>().v7();

    if (_charactersBox.isEmpty || _characterModulesBox.isEmpty) {
      await clear();
      print('Seeding initial data');
      final CharacterModel initialCharacter = CharacterModel(
        id: characterId,
        name: 'Aecian',
        characterClass: 'Wizard',
        ancestry: 'Astral Elf',
        system: 'D&D 5e',
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );
      await saveCharacter(initialCharacter);
      print('Saved initial character');
      final CharacterModulesModel initialModules = CharacterModulesModel(
        characterId: characterId,
        modules: [
          ModuleModel(
            id: 'id1',
            type: ModuleType.text,
            title: 'Test',
            data: {'content': 'This is a test content for the text module.'},
          ),
          ModuleModel(
            id: 'id2',
            type: ModuleType.tracker,
            title: 'Health Point',
            data: {'value': 37, 'maxValue': 64},
          ),
          ModuleModel(
            id: 'id3',
            type: ModuleType.integer,
            title: 'STR',
            data: {'value': 10, 'readOnly': false},
          ),
        ],
      );
      bool result = await saveCharacterModules(initialModules);
      print('saved initial character modules: $result');
    }
  }
}
