// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecies_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProphecyEntity _$ProphecyEntityFromJson(Map<String, dynamic> json) {
  return ProphecyEntity(
    id: _$enumDecodeNullable(_$ProphecyTypeEnumMap, json['id']),
    value: (json['value'] as num)?.toDouble(),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$ProphecyEntityToJson(ProphecyEntity instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
      'id': _$ProphecyTypeEnumMap[instance.id],
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
  ProphecyType.LUCK: 'LUCK',
  ProphecyType.INTERNAL_STRENGTH: 'INTERNAL_STRENGTH',
  ProphecyType.MOODLET: 'MOODLET',
  ProphecyType.AMBITION: 'AMBITION',
  ProphecyType.INTUITION: 'INTUITION',
};
