import 'package:hive_ce/hive.dart';

part 'module_model.g.dart';

@HiveType(typeId: 1)
class ModuleModel {
  @HiveField(0)
  final String id;

  ModuleModel({required this.id});
}
