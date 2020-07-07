// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecy.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$ProphecyModel {
  const _$ProphecyModel();

  String get id;
  String get name;
  double get value;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! ProphecyModel) return false;

    return true &&
        this.id == other.id &&
        this.name == other.name &&
        this.value == other.value;
  }

  int get hashCode {
    return mapPropsToHashCode([id, name, value]);
  }

  String toString() {
    return 'ProphecyModel <\'id\': ${this.id},\'name\': ${this.name},\'value\': ${this.value},>';
  }

  ProphecyModel copyWith({int id, String name, double value}) {
    return ProphecyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProphecyModel _$ProphecyModelFromJson(Map<String, dynamic> json) {
  return ProphecyModel(
    id: json['id'] as String,
    name: json['name'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProphecyModelToJson(ProphecyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
