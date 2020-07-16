import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'impact.g.dart';

@JsonSerializable()
class ImpactModel {
  final String changeIconName;
  final String changeText;
  final double value;

  ImpactModel({
    @required this.changeIconName,
    @required this.changeText,
    @required this.value,
  });

  Map<String, Object> toJson() => _$ImpactModelToJson(this);

  static ImpactModel fromJson(Map<String, Object> json) =>
      _$ImpactModelFromJson(json);
}
