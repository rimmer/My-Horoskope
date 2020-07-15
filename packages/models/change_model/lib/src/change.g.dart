// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeModel _$ChangeModelFromJson(Map<String, dynamic> json) {
  return ChangeModel(
    changeIconName: json['changeIconName'] as String,
    changeText: json['changeText'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ChangeModelToJson(ChangeModel instance) =>
    <String, dynamic>{
      'changeIconName': instance.changeIconName,
      'changeText': instance.changeText,
      'value': instance.value,
    };
