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
    country: json['country'] as String,
    place: json['place'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'place': instance.place,
      'birth': instance.birth,
      'sex': instance.sex,
    };
