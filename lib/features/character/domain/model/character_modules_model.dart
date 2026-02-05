import 'package:hive_ce/hive.dart';
import 'package:ttrpgcharacter/features/module/domain/model/module_model.dart';

part 'character_modules_model.g.dart';

@HiveType(typeId: 2)
class CharacterModulesModel {
  @HiveField(0)
  final String characterId;
  @HiveField(1)
  final List<ModuleModel> modules;

  CharacterModulesModel({required this.characterId, required this.modules});
}
