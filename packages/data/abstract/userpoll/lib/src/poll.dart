import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';

part 'poll.g.dart';

const int POLL_DEFAULT_INIT_VALUE = 3;

@JsonSerializable()
class UserPoll {
  PollModel mood;
  PollModel productivity;
  PollModel relationships;
  PollModel selfdevelopment;
  PollModel physicalActivity;

  UserPoll({
    @required int mood,
    int productivity,
    int relationships,
    int selfdevelopment,
    int physicalActivity,
  }) {
    this.mood = PollModel(
      type: PollModelType.MOOD,
      value: mood,
    );
    this.productivity = PollModel(
      type: PollModelType.PRODUCTIVITY,
      value: productivity ?? mood,
    );
    this.relationships = PollModel(
      type: PollModelType.RELATIONSHIPS,
      value: relationships ?? mood,
    );
    this.selfdevelopment = PollModel(
      type: PollModelType.SELFDEVELOPMENT,
      value: selfdevelopment ?? mood,
    );
    this.physicalActivity = PollModel(
      type: PollModelType.PHYSICAL_ACTIVITY,
      value: physicalActivity ?? mood,
    );
  }

  Map<String, Object> toJson() => _$UserPollToJson(this);

  static UserPoll fromJson(Map<String, Object> json) =>
      _$UserPollFromJson(json);
}
