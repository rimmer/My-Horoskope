// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    name: json['name'] as String,
    birth: json['birth'] as int,
    sex: json['sex'] as int,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'birth': instance.birth,
      'sex': instance.sex,
    };

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
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$UserRoleEnumMap[instance.role],
      'model': instance.model,
      'ambiance': instance.ambiance,
      'lastLogin': instance.lastLogin,
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
  UserRole.FRIEND: 'FRIEND',
  UserRole.COWORKER: 'COWORKER',
  UserRole.MANAGER: 'MANAGER',
  UserRole.SUBORDINATE: 'SUBORDINATE',
  UserRole.BOYFRIEND: 'BOYFRIEND',
  UserRole.GIRLFRIEND: 'GIRLFRIEND',
  UserRole.LOVER: 'LOVER',
  UserRole.HUSBAND: 'HUSBAND',
  UserRole.WIFE: 'WIFE',
  UserRole.SON: 'SON',
  UserRole.DAUGHTER: 'DAUGHTER',
  UserRole.FAMILY: 'FAMILY',
  UserRole.PET: 'PET',
  UserRole.GUARDIAN: 'GUARDIAN',
};
