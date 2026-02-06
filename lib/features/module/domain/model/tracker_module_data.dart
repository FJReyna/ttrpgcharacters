import 'package:json_annotation/json_annotation.dart';

part 'tracker_module_data.g.dart';

@JsonSerializable()
class TrackerModuleData {
  final int value;
  final int maxValue;

  TrackerModuleData({required this.value, required this.maxValue});

  factory TrackerModuleData.fromJson(Map<String, dynamic> json) =>
      _$TrackerModuleDataFromJson(json);
  Map<String, dynamic> toJson() => _$TrackerModuleDataToJson(this);
}
