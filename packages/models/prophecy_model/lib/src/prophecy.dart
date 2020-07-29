import 'package:dataclass/dataclass.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'prophecy.g.dart';

enum ProphecyId {
  LUCK,
  INTERNAL_STRENGTH,
  MOODLET,
  AMBITION,
  INTELLIGENCE,
}

extension ToString on ProphecyId {
  String get str {
    switch (this) {
      case ProphecyId.LUCK:
        return "LUCK";
      case ProphecyId.INTERNAL_STRENGTH:
        return "INTERNAL_STRENGTH";
      case ProphecyId.MOODLET:
        return "MOODLET";
      case ProphecyId.AMBITION:
        return "AMBITION";
      case ProphecyId.INTELLIGENCE:
        return "INTELLIGENCE";
    }
  }
}

extension ToProphecyId on String {
  ProphecyId get prophecyId {
    switch (this) {
      case "LUCK":
        return ProphecyId.LUCK;
      case "INTERNAL_STRENGTH":
        return ProphecyId.INTERNAL_STRENGTH;
      case "MOODLET":
        return ProphecyId.MOODLET;
      case "AMBITION":
        return ProphecyId.AMBITION;
      case "INTELLIGENCE":
      default:
        return ProphecyId.INTELLIGENCE;
    }
  }
}

@JsonSerializable()
@dataClass
@immutable
class ProphecyModel extends _$ProphecyModel {
  final String id;
  final double value;

  ProphecyModel({@required ProphecyId id, @required this.value})
      : this.id = id.str;

  Map<String, Object> toJson() => _$ProphecyModelToJson(this);

  static ProphecyModel fromJson(Map<String, Object> json) =>
      _$ProphecyModelFromJson(json);
}
