// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProphecyModel _$ProphecyModelFromJson(Map<String, dynamic> json) {
  return ProphecyModel(
    id: _$enumDecodeNullable(_$ProphecyTypeEnumMap, json['id']),
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProphecyModelToJson(ProphecyModel instance) =>
    <String, dynamic>{
      'id': _$ProphecyTypeEnumMap[instance.id],
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

const _$ProphecyTypeEnumMap = {
  ProphecyType.ROOT: 'ROOT',
  ProphecyType.SACRAL: 'SACRAL',
  ProphecyType.SOLAR: 'SOLAR',
  ProphecyType.HEART: 'HEART',
  ProphecyType.THROAT: 'THROAT',
};

ProphecyEntity _$ProphecyEntityFromJson(Map<String, dynamic> json) {
  return ProphecyEntity(
    id: _$enumDecodeNullable(_$ProphecyTypeEnumMap, json['id']),
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProphecyEntityToJson(ProphecyEntity instance) =>
    <String, dynamic>{
      'value': instance.value,
      'id': _$ProphecyTypeEnumMap[instance.id],
    };
