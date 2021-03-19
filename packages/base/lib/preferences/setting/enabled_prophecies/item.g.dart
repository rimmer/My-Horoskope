// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnabledProphecies _$EnabledPropheciesFromJson(Map<String, dynamic> json) {
  return EnabledProphecies(
    luck: json['luck'] as bool,
    internalStrength: json['internalStrength'] as bool,
    moodlet: json['moodlet'] as bool,
    ambition: json['ambition'] as bool,
    intuition: json['intuition'] as bool,
  );
}

Map<String, dynamic> _$EnabledPropheciesToJson(EnabledProphecies instance) =>
    <String, dynamic>{
      'luck': instance.luck,
      'internalStrength': instance.internalStrength,
      'moodlet': instance.moodlet,
      'ambition': instance.ambition,
      'intuition': instance.intuition,
    };
