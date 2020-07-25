// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImpactModel _$ImpactModelFromJson(Map<String, dynamic> json) {
  return ImpactModel(
    iconName: json['iconName'] as String,
    text: json['text'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ImpactModelToJson(ImpactModel instance) =>
    <String, dynamic>{
      'iconName': instance.iconName,
      'text': instance.text,
      'value': instance.value,
    };
