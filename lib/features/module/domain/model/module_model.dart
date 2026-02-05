import 'package:hive_ce/hive.dart';

part 'module_model.g.dart';

enum ModuleType { text, integer, tracker }

@HiveType(typeId: 1)
class ModuleModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final ModuleType type;
  @HiveField(2)
  final String title;

  ModuleModel({required this.id, required this.type, required this.title});
}
