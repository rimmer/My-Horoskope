import 'package:dataclass/dataclass.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'prophecy.g.dart';

@JsonSerializable()
@dataClass
class ProphecyModel extends _$ProphecyModel {
  final String id;
  final String name;
  final double value;

  const ProphecyModel(
      {@required this.id, @required this.name, @required this.value});

  Map<String, Object> toJson() => _$ProphecyModelToJson(this);

  static ProphecyModel fromJson(Map<String, Object> json) =>
      _$ProphecyModelFromJson(json);
}
