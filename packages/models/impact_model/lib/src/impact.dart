import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'impact.g.dart';

@JsonSerializable()
@immutable
class ImpactModel {
  final String iconName;
  final String text;
  final double value;

  ImpactModel({
    @required this.iconName,
    @required this.text,
    @required this.value,
  });

  Map<String, Object> toJson() => _$ImpactModelToJson(this);

  static ImpactModel fromJson(Map<String, Object> json) =>
      _$ImpactModelFromJson(json);
}
