import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:userpoll/userpoll.dart';

part 'pollbydate.g.dart';

@JsonSerializable()
class PollByDate {
  Map<int, UserPoll> date;
  PollByDate({@required map}) : date = map ?? {};

  Map<String, Object> toJson() => _$PollByDateToJson(this);

  static PollByDate fromJson(Map<String, Object> json) =>
      _$PollByDateFromJson(json);
}
