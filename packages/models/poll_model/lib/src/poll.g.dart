// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollModel _$PollModelFromJson(Map<String, dynamic> json) {
  return PollModel(
    type: _$enumDecodeNullable(_$PollModelTypeEnumMap, json['type']),
    value: json['value'] as int,
  );
}

Map<String, dynamic> _$PollModelToJson(PollModel instance) => <String, dynamic>{
      'type': _$PollModelTypeEnumMap[instance.type],
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

const _$PollModelTypeEnumMap = {
  PollModelType.MOOD: 'MOOD',
  PollModelType.PRODUCTIVITY: 'PRODUCTIVITY',
  PollModelType.RELATIONSHIPS: 'RELATIONSHIPS',
  PollModelType.SELFDEVELOPMENT: 'SELFDEVELOPMENT',
  PollModelType.PHYSICAL_ACTIVITY: 'PHYSICAL_ACTIVITY',
};
