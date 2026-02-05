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

      final CharacterModulesModel initialModules = CharacterModulesModel(
        characterId: characterId,
        modules: [ModuleModel(id: 'id')],
      );
      await saveCharacterModules(initialModules);
    }
  }
}
