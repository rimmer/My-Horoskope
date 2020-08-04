// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecies_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProphecyEntity _$ProphecyEntityFromJson(Map<String, dynamic> json) {
  return ProphecyEntity(
    value: (json['value'] as num)?.toDouble(),
    impact: json['impact'] == null
        ? null
        : ImpactModel.fromJson(json['impact'] as Map<String, dynamic>),
  )..haveText = json['haveText'] as bool;
}

Map<String, dynamic> _$ProphecyEntityToJson(ProphecyEntity instance) =>
    <String, dynamic>{
      'haveText': instance.haveText,
      'impact': instance.impact,
      'value': instance.value,
    };
