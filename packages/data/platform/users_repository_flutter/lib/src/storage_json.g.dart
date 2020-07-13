// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersRepositoryStorageJson _$UsersRepositoryStorageJsonFromJson(
    Map<String, dynamic> json) {
  return UsersRepositoryStorageJson(
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersRepositoryStorageJsonToJson(
        UsersRepositoryStorageJson instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
