import 'package:meta/meta.dart';
import 'package:impact_model/impact_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:prophecy_model/prophecy_model.dart';

part 'prophecy.g.dart';

@JsonSerializable()
class ProphecyEntity {
  ProphecyModel model;
  final List<ImpactModel> changes;

  ProphecyEntity({@required this.model, @required this.changes});

  Map<String, Object> toJson() => _$ProphecyEntityToJson(this);

  static ProphecyEntity fromJson(Map<String, Object> json) =>
      _$ProphecyEntityFromJson(json);
}
