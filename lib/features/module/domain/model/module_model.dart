import 'package:hive_ce/hive.dart';

part 'module_model.g.dart';

@HiveType(typeId: 3)
enum ModuleType {
  @HiveField(0)
  text,
  @HiveField(1)
  integer,
  @HiveField(2)
  tracker,
}

@HiveType(typeId: 1)
class ModuleModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final ModuleType type;
  @HiveField(2)
  final String title;
  @HiveField(3)
  Map<String, dynamic> data;

  ModuleModel({
    required this.id,
    required this.type,
    required this.title,
    this.data = const {},
  });
}
