import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:prophecy_model/prophecy_model.dart';

part 'prophecies_object.g.dart';

/// Prophecies object is used to corretly transfer
/// and show calculated prophecies in the apps

extension PropheciesObject on Map<ProphecyType, ProphecyEntity> {
  ProphecyType get least {
    ProphecyEntity res;
    double min = double.maxFinite;

    for (var prophecy in this.values) {
      if (prophecy.value < min) {
        min = prophecy.value;
        res = prophecy;
      }
    }

    return res.id;
  }

  ProphecyType get biggest {
    ProphecyEntity res;
    double max = double.minPositive;

    for (var prophecy in this.values) {
      if (prophecy.value > max) {
        max = prophecy.value;
        res = prophecy;
      }
    }

    return res.id;
  }
}

Map<ProphecyType, ProphecyEntity> Prophecies() => {
      ProphecyType.INTERNAL_STRENGTH:
          ProphecyEntity(id: ProphecyType.INTERNAL_STRENGTH),
      ProphecyType.MOODLET: ProphecyEntity(id: ProphecyType.MOODLET),
      ProphecyType.AMBITION: ProphecyEntity(id: ProphecyType.AMBITION),
      ProphecyType.INTUITION: ProphecyEntity(id: ProphecyType.INTUITION),
      ProphecyType.LUCK: ProphecyEntity(id: ProphecyType.LUCK),
    };

/// Prophecy entity consists of prophecy model
/// and text that will explain prophecy
///
/// This class can be changed in future

@JsonSerializable()
class ProphecyEntity {
  /// fields are mutable, but

  /// model is immutable and
  /// must be recreated every time it changed
  /// (makes it failproof)
  ProphecyModel _prophecy;
  //

  ProphecyEntity({
    @required ProphecyType id,
    double value = 0.0,
  }) {
    _prophecy = ProphecyModel(id: id, value: value);
  }

  double get value => _prophecy.value;
  void set value(double newVal) =>
      _prophecy = ProphecyModel(id: _prophecy.id, value: newVal);

  ProphecyType get id => _prophecy.id;
  void set id(ProphecyType newId) =>
      _prophecy = ProphecyModel(id: newId, value: _prophecy.value);

  Map<String, Object> toJson() => _$ProphecyEntityToJson(this);

  static ProphecyEntity fromJson(Map<String, Object> json) =>
      _$ProphecyEntityFromJson(json);
}
