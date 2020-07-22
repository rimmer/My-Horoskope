part of '../interface.dart';

class _ImplRites implements _Algorithm {
  final PollAvailability pollAvailability;
  // final Map<int, UserPoll> pollByDate;

  UserPoll currentPoll;
  _ImplRites({
    @required this.pollAvailability,
    currentPoll,
  }) : this.currentPoll =
            currentPoll ?? UserPoll(mood: POLL_DEFAULT_INIT_VALUE);
}
