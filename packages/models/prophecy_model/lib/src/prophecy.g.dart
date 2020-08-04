// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecy.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$ProphecyModel {
  const _$ProphecyModel();

  ProphecyId get id;
  double get value;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! ProphecyModel) return false;

    return true && this.id == other.id && this.value == other.value;
  }

  int get hashCode {
    return mapPropsToHashCode([id, value]);
  }

  String toString() {
    return 'ProphecyModel <\'id\': ${this.id},\'value\': ${this.value},>';
  }

  ProphecyModel copyWith({ProphecyId id, double value}) {
    return ProphecyModel(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProphecyModel _$ProphecyModelFromJson(Map<String, dynamic> json) {
  return ProphecyModel(
    id: _$enumDecodeNullable(_$ProphecyIdEnumMap, json['id']),
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProphecyModelToJson(ProphecyModel instance) =>
    <String, dynamic>{
      'id': _$ProphecyIdEnumMap[instance.id],
      'value': instance.value,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ProphecyIdEnumMap = {
  ProphecyId.LUCK: 'LUCK',
  ProphecyId.INTERNAL_STRENGTH: 'INTERNAL_STRENGTH',
  ProphecyId.MOODLET: 'MOODLET',
  ProphecyId.AMBITION: 'AMBITION',
  ProphecyId.INTELLIGENCE: 'INTELLIGENCE',
};
