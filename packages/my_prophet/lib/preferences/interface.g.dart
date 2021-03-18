// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppPreferencesDat _$AppPreferencesDatFromJson(Map<String, dynamic> json) {
  return AppPreferencesDat(
    ep: json['ep'] == null
        ? null
        : EnabledProphecies.fromJson(json['ep'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppPreferencesDatToJson(AppPreferencesDat instance) =>
    <String, dynamic>{
      'ep': instance.ep,
    };
