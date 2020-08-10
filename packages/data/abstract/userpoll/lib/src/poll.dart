import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';

part 'poll.g.dart';

const int POLL_DEFAULT_INIT_VALUE = 3;

@JsonSerializable()
class UserPoll {
  int dt;
  PollModel mood;
  List<PollModel> details = [];

  UserPoll({
    @required this.dt,
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

  int val(int index) => this.details[index].value;

  void accamulateDetails(List<int> detailsAccamulator) {
    if (detailsAccamulator == null ||
        detailsAccamulator.length != details.length) return;
    //
    //
  }

  Map<String, Object> toJson() => _$UserPollToJson(this);

  static UserPoll fromJson(Map<String, Object> json) =>
      _$UserPollFromJson(json);
}
