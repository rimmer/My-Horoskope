import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'prophecy.g.dart';

enum ProphecyType {
  ROOT,
  SACRAL,
  SOLAR,
  HEART,
  THROAT,
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
  double get sum {
    double sum = 0.0;
    this.forEach((key, value) {
      sum += value.value;
    });
    return sum;
  }

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

  void limit(
      {@required ProphecyType type,
      @required double min,
      @required double max}) {
    //

    final unLimVal = this[type].value;

    if (unLimVal > max)
      this[type].value = max;
    else if (unLimVal < min) this[type].value = min;
  }
}

Map<ProphecyType, ProphecyEntity> limitProphecies(
    {@required Map<ProphecyType, ProphecyEntity> prophecies,
    @required double min,
    @required double max}) {
  //
  PropheciesObject(prophecies)
      .limit(type: ProphecyType.ROOT, min: min, max: max);
  PropheciesObject(prophecies)
      .limit(type: ProphecyType.SACRAL, min: min, max: max);
  PropheciesObject(prophecies)
      .limit(type: ProphecyType.SOLAR, min: min, max: max);
  PropheciesObject(prophecies)
      .limit(type: ProphecyType.HEART, min: min, max: max);
  PropheciesObject(prophecies)
      .limit(type: ProphecyType.THROAT, min: min, max: max);

  return prophecies;
}

// ignore: non_constant_identifier_names
Map<ProphecyType, ProphecyEntity> Prophecies() => {
      ProphecyType.ROOT: ProphecyEntity(id: ProphecyType.ROOT),
      ProphecyType.SACRAL: ProphecyEntity(id: ProphecyType.SACRAL),
      ProphecyType.SOLAR: ProphecyEntity(id: ProphecyType.SOLAR),
      ProphecyType.HEART: ProphecyEntity(id: ProphecyType.HEART),
      ProphecyType.THROAT: ProphecyEntity(id: ProphecyType.THROAT),
    };
