import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'change.g.dart';

@JsonSerializable()
class ChangeModel {
  final String changeIconName;
  final String changeText;
  final double value;

  ChangeModel({
    @required this.changeIconName,
    @required this.changeText,
    @required this.value,
  });

  Map<String, Object> toJson() => _$ChangeModelToJson(this);

  static ChangeModel fromJson(Map<String, Object> json) =>
      _$ChangeModelFromJson(json);
}
