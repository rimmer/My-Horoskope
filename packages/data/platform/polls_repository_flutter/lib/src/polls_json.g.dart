// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPollListWrapper _$_UserPollListWrapperFromJson(Map<String, dynamic> json) {
  return _UserPollListWrapper(
    (json['wrapped'] as List)
        ?.map((e) =>
            e == null ? null : UserPoll.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_UserPollListWrapperToJson(
        _UserPollListWrapper instance) =>
    <String, dynamic>{
      'wrapped': instance.wrapped,
    };
