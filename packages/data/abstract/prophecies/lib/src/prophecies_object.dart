import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:prophecy_model/prophecy_model.dart';

part 'prophecies_object.g.dart';

extension PropheciesObject on Map<ProphecyId, ProphecyEntity> {
  void addText({@required ProphecyId id, @required String text}) {
    this[id].text = text;
  }
}

Map<ProphecyId, ProphecyEntity> Prophecies() => {
      ProphecyId.INTERNAL_STRENGTH:
          ProphecyEntity(id: ProphecyId.INTERNAL_STRENGTH),
      ProphecyId.MOODLET: ProphecyEntity(id: ProphecyId.MOODLET),
      ProphecyId.AMBITION: ProphecyEntity(id: ProphecyId.AMBITION),
      ProphecyId.INTELLIGENCE: ProphecyEntity(id: ProphecyId.INTELLIGENCE),
      ProphecyId.LUCK: ProphecyEntity(id: ProphecyId.LUCK),
    };

@JsonSerializable()
class ProphecyEntity {
  ProphecyModel _prophecy;
  String text;

  ProphecyEntity({@required ProphecyId id, double value = 0.0, this.text}) {
    _prophecy = ProphecyModel(id: id, value: value);
  }

  double get value => _prophecy.value;
  void set value(double newVal) =>
      _prophecy = ProphecyModel(id: _prophecy.id, value: newVal);

  Map<String, Object> toJson() => _$ProphecyEntityToJson(this);

  static ProphecyEntity fromJson(Map<String, Object> json) =>
      _$ProphecyEntityFromJson(json);
}
