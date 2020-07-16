// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImpactModel _$ImpactModelFromJson(Map<String, dynamic> json) {
  return ImpactModel(
    changeIconName: json['changeIconName'] as String,
    changeText: json['changeText'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ImpactModelToJson(ImpactModel instance) =>
    <String, dynamic>{
      'changeIconName': instance.changeIconName,
      'changeText': instance.changeText,
      'value': instance.value,
    };
