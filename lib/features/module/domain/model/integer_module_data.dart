import 'package:json_annotation/json_annotation.dart';

part 'integer_module_data.g.dart';

@JsonSerializable()
class IntegerModuleData {
  final int value;
  final bool readOnly;

  IntegerModuleData({required this.value, required this.readOnly});

  factory IntegerModuleData.fromJson(Map<String, dynamic> json) =>
      _$IntegerModuleDataFromJson(json);
  Map<String, dynamic> toJson() => _$IntegerModuleDataToJson(this);
}
