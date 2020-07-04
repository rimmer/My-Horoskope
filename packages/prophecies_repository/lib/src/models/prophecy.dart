import 'package:dataclass/dataclass.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prophecy.g.dart';

@JsonSerializable()
@dataClass
class Prophecy extends _$Prophecy {
  final String id;
  final String name;
  final double value;

  const Prophecy({this.id, this.name, this.value});

  Map<String, Object> toJson() => _$ProphecyToJson(this);

  static Prophecy fromJson(Map<String, Object> json) =>
      _$ProphecyFromJson(json);
}