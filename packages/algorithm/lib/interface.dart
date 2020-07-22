import 'package:meta/meta.dart';
import 'package:poll_availability/poll_availability.dart';
import 'package:userpoll/userpoll.dart';

part 'variants/algorithm_bgoncharuck.dart';
part 'variants/algorithm_bbks.dart';

abstract class _Algorithm {
  PollAvailability get pollAvailability;
  // Map<int, UserPoll> get pollByDate;
  UserPoll currentPoll;
}

class Algorithm {
  _Algorithm implementation;

  Algorithm({PollAvailability pollAvaibility}) {
    implementation = _ImplRites(
      pollAvailability: pollAvaibility ?? PollAvailability(value: true),
    );
  }

  PollAvailability get pollAvailability => implementation.pollAvailability;

  UserPoll get currentPoll => implementation.currentPoll;
  void set currentPoll(UserPoll poll) => implementation.currentPoll = poll;
}
