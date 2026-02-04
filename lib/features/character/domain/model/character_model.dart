import 'package:hive_ce/hive.dart';

part 'character_model.g.dart';

@HiveType(typeId: 0)
class CharacterModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String characterClass;
  @HiveField(3)
  String ancestry;
  @HiveField(4)
  String system;
  @HiveField(5)
  DateTime updatedAt;
  @HiveField(6)
  DateTime createdAt;

  CharacterModel({
    required this.id,
    required this.name,
    required this.characterClass,
    required this.ancestry,
    required this.system,
    required this.updatedAt,
    required this.createdAt,
  });
}
