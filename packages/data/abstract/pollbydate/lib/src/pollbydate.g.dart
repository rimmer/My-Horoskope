// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollbydate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollByDate _$PollByDateFromJson(Map<String, dynamic> json) {
  return PollByDate()
    ..date = (json['date'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k),
          e == null ? null : UserPoll.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$PollByDateToJson(PollByDate instance) =>
    <String, dynamic>{
      'date': instance.date?.map((k, e) => MapEntry(k.toString(), e)),
    };
