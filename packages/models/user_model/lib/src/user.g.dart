// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$UserModel {
  const _$UserModel();

  String get name;
  int get birth;
  int get sex;
  String get country;
  String get place;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! UserModel) return false;

    return true &&
        this.name == other.name &&
        this.birth == other.birth &&
        this.sex == other.sex &&
        this.country == other.country &&
        this.place == other.place;
  }

  int get hashCode {
    return mapPropsToHashCode([name, birth, sex, country, place]);
  }

  String toString() {
    return 'UserModel <\'name\': ${this.name},\'birth\': ${this.birth},\'sex\': ${this.sex},\'country\': ${this.country},\'place\': ${this.place},>';
  }

  UserModel copyWith(
      {String name, int birth, int sex, String country, String place}) {
    return UserModel(
      name: name ?? this.name,
      birth: birth ?? this.birth,
      sex: sex ?? this.sex,
      country: country ?? this.country,
      place: place ?? this.place,
    );
  }
}

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
      'birth': instance.birth,
      'sex': instance.sex,
      'country': instance.country,
      'place': instance.place,
    };
