// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    id: json['id'],
    role: _$enumDecodeNullable(_$UserRoleEnumMap, json['role']),
    ambiance: (json['ambiance'] as List)
        ?.map((e) =>
            e == null ? null : UserEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastLogin: json['lastLogin'] as bool,
    model: json['model'] == null
        ? null
        : UserModel.fromJson(json['model'] as Map<String, dynamic>),
    pollAvailability: json['pollAvailability'] as bool,
    pollStudying: json['pollStudying'] as bool,
    pollsAreComplex: json['pollsAreComplex'] as bool,
    internalStrIsEnabled: json['internalStrIsEnabled'] as bool,
    moodletIsEnabled: json['moodletIsEnabled'] as bool,
    ambitionIsEnabled: json['ambitionIsEnabled'] as bool,
    intelligenceIsEnabled: json['intelligenceIsEnabled'] as bool,
    luckIsEnabled: json['luckIsEnabled'] as bool,
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$UserRoleEnumMap[instance.role],
      'model': instance.model,
      'ambiance': instance.ambiance,
      'lastLogin': instance.lastLogin,
      'pollAvailability': instance.pollAvailability,
      'pollStudying': instance.pollStudying,
      'pollsAreComplex': instance.pollsAreComplex,
      'internalStrIsEnabled': instance.internalStrIsEnabled,
      'moodletIsEnabled': instance.moodletIsEnabled,
      'ambitionIsEnabled': instance.ambitionIsEnabled,
      'intelligenceIsEnabled': instance.intelligenceIsEnabled,
      'luckIsEnabled': instance.luckIsEnabled,
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

const _$UserRoleEnumMap = {
  UserRole.NONE: 'NONE',
  UserRole.USER: 'USER',
  UserRole.SOULMATE: 'SOULMATE',
  UserRole.FRIEND: 'FRIEND',
};
