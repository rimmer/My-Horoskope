// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPoll _$UserPollFromJson(Map<String, dynamic> json) {
  return UserPoll(
    mood: json['mood'] as int,
  )..details = (json['details'] as List)
      ?.map((e) =>
          e == null ? null : PollModel.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$UserPollToJson(UserPoll instance) => <String, dynamic>{
      'mood': instance.mood,
      'details': instance.details,
    };
