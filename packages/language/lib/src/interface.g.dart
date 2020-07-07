// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locale _$LocaleFromJson(Map<String, dynamic> json) {
  return Locale(
    name: json['name'] as String,
    birthdate: json['birthdate'] as String,
    birthcountry: json['birthcountry'] as String,
    birthplace: json['birthplace'] as String,
    sex: json['sex'] as String,
    male: json['male'] as String,
    female: json['female'] as String,
    other: json['other'] as String,
    notSelectedSex: json['notSelectedSex'] as String,
    termsAccept: json['termsAccept'] as String,
    privacyPolicy: json['privacyPolicy'] as String,
    userAgreement: json['userAgreement'] as String,
  );
}

Map<String, dynamic> _$LocaleToJson(Locale instance) => <String, dynamic>{
      'name': instance.name,
      'birthdate': instance.birthdate,
      'birthcountry': instance.birthcountry,
      'birthplace': instance.birthplace,
      'sex': instance.sex,
      'male': instance.male,
      'female': instance.female,
      'other': instance.other,
      'notSelectedSex': instance.notSelectedSex,
      'termsAccept': instance.termsAccept,
      'privacyPolicy': instance.privacyPolicy,
      'userAgreement': instance.userAgreement,
    };
