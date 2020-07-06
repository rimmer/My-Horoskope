// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecy_entity.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$ProphecyEntity {
  const _$ProphecyEntity();

  String get id;
  String get name;
  double get value;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! ProphecyEntity) return false;

    return true &&
        this.id == other.id &&
        this.name == other.name &&
        this.value == other.value;
  }

  int get hashCode {
    return mapPropsToHashCode([id, name, value]);
  }

  String toString() {
    return 'ProphecyEntity <\'id\': ${this.id},\'name\': ${this.name},\'value\': ${this.value},>';
  }

  ProphecyEntity copyWith({String id, String name, double value}) {
    return ProphecyEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProphecyEntity _$ProphecyEntityFromJson(Map<String, dynamic> json) {
  return ProphecyEntity(
    id: json['id'] as String,
    name: json['name'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProphecyEntityToJson(ProphecyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
