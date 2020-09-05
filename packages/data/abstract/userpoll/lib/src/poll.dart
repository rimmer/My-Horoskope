import 'dart:convert';

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

  /// if poll was voted
  bool voted;

  /// main poll model type, that must exist independent from future changes
  PollModel mood;

  /// all other poll types, that defaults to mood poll
  List<PollModel> details;

  UserPoll({
    @required this.dt,
    this.voted = false,
    @required int mood,
    this.details,
    int productivity,
    int relationships,
    int selfdevelopment,
    int physicalActivity,
  }) {
    this.mood = PollModel(
      type: PollModelType.MOOD,
      value: mood,
    );
    if (details == null) {
      details = [];
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
      for (int indx = 0; indx < detailsAccamulator.length; indx++)
        detailsAccamulator[indx] += details[indx].value;
    } else {
      for (int indx = 0; indx < detailsAccamulator.length; indx++)
        detailsAccamulator[indx] = details[indx].value;
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

  void pollSet(PollModelType type, int value) {
    //

    if (type == PollModelType.MOOD) {
      this.mood = PollModel(
        type: type,
        value: value,
      );
      return;
    }

    //

    if (details[pollIndx(type)] != null)
      details[pollIndx(type)] = PollModel(
        type: type,
        value: value,
      );
  }

  void pollSetAll(int value) {
    this.mood = PollModel(
      type: PollModelType.MOOD,
      value: value,
    );

    for (int indx = 0; indx < details.length; indx++) {
      details[indx] = PollModel(
        value: value,
        type: details[indx].type,
      );
    }
  }

  Map<String, Object> toJson() => _$UserPollToJson(this);

  static UserPoll fromJson(Map<String, Object> json) =>
      _$UserPollFromJson(json);

  @override
  String toString() {
    return json.encode(this.toJson());
  }
}
