import 'package:json_annotation/json_annotation.dart';

part 'text_module_data.g.dart';

@JsonSerializable()
class TextModuleData {
  final String content;

  TextModuleData({required this.content});

  factory TextModuleData.fromJson(Map<String, dynamic> json) =>
      _$TextModuleDataFromJson(json);
  Map<String, dynamic> toJson() => _$TextModuleDataToJson(this);
}
