import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'prophecy.g.dart';

/// exact prophecy model that will be showed in the apps

/// can be expanded in future
enum ProphecyType {
  LUCK,
  INTERNAL_STRENGTH,
  MOODLET,
  AMBITION,
  INTELLIGENCE,
}

extension ProphecyTypeToString on ProphecyType {
  String get toStr => _$ProphecyTypeEnumMap[this];
}

@JsonSerializable()
@immutable
class ProphecyModel {
  final ProphecyType id;

  /// can be any positive value because will be recreated by algorithm
  final double value;

  ProphecyModel({@required ProphecyType this.id, @required this.value});

  Map<String, Object> toJson() => _$ProphecyModelToJson(this);

  static ProphecyModel fromJson(Map<String, Object> json) =>
      _$ProphecyModelFromJson(json);
}
