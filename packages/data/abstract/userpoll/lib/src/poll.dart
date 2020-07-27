import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';

part 'poll.g.dart';

const int POLL_DEFAULT_INIT_VALUE = 3;

@JsonSerializable()
class UserPoll {
  PollModel mood;
  List<PollModel> details = [];

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
    this.details.add(PollModel(
          type: PollModelType.PRODUCTIVITY,
          value: productivity ?? mood,
        ));
    this.details.add(PollModel(
          type: PollModelType.RELATIONSHIPS,
          value: relationships ?? mood,
        ));
    this.details.add(PollModel(
          type: PollModelType.SELFDEVELOPMENT,
          value: selfdevelopment ?? mood,
        ));
    this.details.add(PollModel(
          type: PollModelType.PHYSICAL_ACTIVITY,
          value: physicalActivity ?? mood,
        ));
  }

  Map<String, Object> toJson() => _$UserPollToJson(this);

  static UserPoll fromJson(Map<String, Object> json) =>
      _$UserPollFromJson(json);
}
