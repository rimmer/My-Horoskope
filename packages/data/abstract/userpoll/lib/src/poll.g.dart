// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPoll _$UserPollFromJson(Map<String, dynamic> json) {
  return UserPoll(
    mood: json['mood'] as int,
    productivity: json['productivity'] as int,
    relationships: json['relationships'] as int,
    selfdevelopment: json['selfdevelopment'] as int,
    physicalActivity: json['physicalActivity'] as int,
  );
}

Map<String, dynamic> _$UserPollToJson(UserPoll instance) => <String, dynamic>{
      'mood': instance.mood,
      'productivity': instance.productivity,
      'relationships': instance.relationships,
      'selfdevelopment': instance.selfdevelopment,
      'physicalActivity': instance.physicalActivity,
    };
