// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollsRepositoryJson _$PollsRepositoryJsonFromJson(Map<String, dynamic> json) {
  return PollsRepositoryJson()
    ..curUserPolls = (json['curUserPolls'] as List)
        ?.map((e) =>
            e == null ? null : UserPoll.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PollsRepositoryJsonToJson(
        PollsRepositoryJson instance) =>
    <String, dynamic>{
      'curUserPolls': instance.curUserPolls,
    };
