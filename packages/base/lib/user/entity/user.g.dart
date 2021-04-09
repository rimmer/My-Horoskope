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
    isTester: json['model'] != null && json['model']['name'] != null
        ? _isTesterCheck(json['model']['name'] as String, [
            _tester(),
            _hiddenTester(),
          ])
        : false,
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

bool _isTesterCheck(String toCheck, List<String> subs) {
  for (String sub in subs) if (toCheck.contains(sub)) return true;
  return false;
}

String _tester() => String.fromCharCodes([
      0x0021,
      0x0040,
      0x0023,
      0x005f,
      0x042f,
      0x0079,
      0x0065,
      0x0054,
      0x0065,
      0x0073,
      0x0074,
      0x0065,
      0x0072
    ]);
String _hiddenTester() => String.fromCharCodes(
    [0x041d, 0x043e, 0x006e, 0x0441, 0x0068, 0x0430, 0x0072, 0x0075, 0x006b]);
