// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prophecy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProphecyEntity _$ProphecyEntityFromJson(Map<String, dynamic> json) {
  return ProphecyEntity(
    model: json['model'] == null
        ? null
        : ProphecyModel.fromJson(json['model'] as Map<String, dynamic>),
    changes: (json['changes'] as List)
        ?.map((e) =>
            e == null ? null : ImpactModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProphecyEntityToJson(ProphecyEntity instance) =>
    <String, dynamic>{
      'model': instance.model,
      'changes': instance.changes,
    };
