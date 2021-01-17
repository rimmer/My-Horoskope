// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollsRepositoryJson _$PollsRepositoryJsonFromJson(Map<String, dynamic> json) {
  return PollsRepositoryJson()
    ..curUserPolls = (json['curUserPolls'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k),
          e == null ? null : UserPoll.fromJson(e as Map<String, dynamic>)),
    )
    ..todayPoll = json['todayPoll'] == null
        ? null
        : UserPoll.fromJson(json['todayPoll'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PollsRepositoryJsonToJson(
        PollsRepositoryJson instance) =>
    <String, dynamic>{
      'curUserPolls':
          instance.curUserPolls?.map((k, e) => MapEntry(k.toString(), e)),
      'todayPoll': instance.todayPoll,
    };
