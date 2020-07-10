// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersStorageJson _$UsersStorageJsonFromJson(Map<String, dynamic> json) {
  return UsersStorageJson(
    users: (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersStorageJsonToJson(UsersStorageJson instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
