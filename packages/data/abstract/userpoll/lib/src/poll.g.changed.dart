// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPoll _$UserPollFromJson(Map<String, dynamic> json) {
  return UserPoll(
    dt: json['dt'] as int,
    voted: json['voted'] as bool,
    mood: PollModel.fromJson(json['mood'] as Map<String, dynamic>).value,
  )..details.addAll((json['details'] as List)
      ?.map((e) =>
          e == null ? null : PollModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$UserPollToJson(UserPoll instance) => <String, dynamic>{
      'dt': instance.dt,
      'voted': instance.voted,
      'mood': instance.mood,
      'details': instance.details,
    };
