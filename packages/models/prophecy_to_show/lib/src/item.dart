import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'item.g.dart';

@JsonSerializable()
@immutable
class EnabledProphecies {
  final bool luck;
  final bool internalStrength;
  final bool moodlet;
  final bool ambition;
  final bool intelligence;

  EnabledProphecies({
    this.luck = true,
    this.internalStrength = true,
    this.moodlet = true,
    this.ambition = true,
    this.intelligence = true,
  });

  Map<String, Object> toJson() => _$EnabledPropheciesToJson(this);

  static EnabledProphecies fromJson(Map<String, Object> json) =>
      _$EnabledPropheciesFromJson(json);
}
