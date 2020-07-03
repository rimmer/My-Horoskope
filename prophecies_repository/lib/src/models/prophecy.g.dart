// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecy.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$Prophecy {
  const _$Prophecy();

  String get id;
  String get name;
  double get value;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! Prophecy) return false;

    return true &&
        this.id == other.id &&
        this.name == other.name &&
        this.value == other.value;
  }

  int get hashCode {
    return mapPropsToHashCode([id, name, value]);
  }

  String toString() {
    return 'Prophecy <\'id\': ${this.id},\'name\': ${this.name},\'value\': ${this.value},>';
  }

  Prophecy copyWith({String id, String name, double value}) {
    return Prophecy(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prophecy _$ProphecyFromJson(Map<String, dynamic> json) {
  return Prophecy(
    id: json['id'] as String,
    name: json['name'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProphecyToJson(Prophecy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
