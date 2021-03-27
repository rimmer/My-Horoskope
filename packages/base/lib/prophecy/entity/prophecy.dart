import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'prophecy.g.dart';

enum ProphecyType {
  LUCK,
  INTERNAL_STRENGTH,
  MOODLET,
  AMBITION,
  INTUITION,
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

  ProphecyModel({@required this.id, @required this.value});

  Map<String, Object> toJson() => _$ProphecyModelToJson(this);

  static ProphecyModel fromJson(Map<String, Object> json) =>
      _$ProphecyModelFromJson(json);
}

@JsonSerializable()
class ProphecyEntity {
  ProphecyModel _prophecy;
  //

  ProphecyEntity({
    @required ProphecyType id,
    double value = 0.0,
  }) {
    _prophecy = ProphecyModel(id: id, value: value);
  }

  double get value => _prophecy.value;
  set value(double newVal) =>
      _prophecy = ProphecyModel(id: _prophecy.id, value: newVal);

  ProphecyType get id => _prophecy.id;
  set id(ProphecyType newId) =>
      _prophecy = ProphecyModel(id: newId, value: _prophecy.value);

  Map<String, Object> toJson() => _$ProphecyEntityToJson(this);

  static ProphecyEntity fromJson(Map<String, Object> json) =>
      _$ProphecyEntityFromJson(json);
}

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

// ignore: non_constant_identifier_names
Map<ProphecyType, ProphecyEntity> Prophecies() => {
      ProphecyType.INTERNAL_STRENGTH:
          ProphecyEntity(id: ProphecyType.INTERNAL_STRENGTH),
      ProphecyType.MOODLET: ProphecyEntity(id: ProphecyType.MOODLET),
      ProphecyType.AMBITION: ProphecyEntity(id: ProphecyType.AMBITION),
      ProphecyType.INTUITION: ProphecyEntity(id: ProphecyType.INTUITION),
      ProphecyType.LUCK: ProphecyEntity(id: ProphecyType.LUCK),
    };
