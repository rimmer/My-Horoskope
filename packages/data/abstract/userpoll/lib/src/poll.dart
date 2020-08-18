import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';

part 'poll.g.dart';

const int POLL_DEFAULT_INIT_VALUE = 3;

/// a collection of poll models that can be:
/// - changed in future
/// - be correctly saved and loaded
/// - even with changes

@JsonSerializable()
class UserPoll {
  /// milliseconds since UNIX epoch of the start of the day, when poll were created
  int dt;

  /// main poll model type, that must exist independent from future changes
  PollModel mood;

  /// all other poll types, that defaults to mood poll
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

  /// accamulates details values to given list of integers
  void accamulateDetails(List<int> detailsAccamulator) {
    if (detailsAccamulator == null ||
        detailsAccamulator.length != details.length) return;
    //
    //
    /// For every new poll new accamulation must be added
    if (detailsAccamulator[0] != null) {
      detailsAccamulator[0] += details[0].value;
      detailsAccamulator[1] += details[1].value;
      detailsAccamulator[2] += details[2].value;
      detailsAccamulator[3] += details[3].value;
    } else {
      detailsAccamulator[0] = details[0].value;
      detailsAccamulator[1] = details[1].value;
      detailsAccamulator[2] = details[2].value;
      detailsAccamulator[3] = details[3].value;
    }
  }

  int pollIndx(PollModelType type) {
    return details.indexWhere(
        //
        (poll) => poll.type == type
        //
        );
  }

  PollModel poll(PollModelType type) {
    if (type == PollModelType.MOOD) return this.mood;
    return details[pollIndx(type)];
  }

  Map<String, Object> toJson() => _$UserPollToJson(this);

  static UserPoll fromJson(Map<String, Object> json) =>
      _$UserPollFromJson(json);
}
