import 'package:meta/meta.dart';
import 'package:poll_availability/poll_availability.dart';
import 'package:userpoll/userpoll.dart';
import 'package:pollbydate/pollbydate.dart';
import 'package:users_repository/users_repository.dart';

part 'variants/algorithm_bgoncharuck.dart';
part 'variants/algorithm_bbks.dart';

// @TODO
// ProphecyObject

class Algorithm {
  // data used by algorithm
  final AlgoData dat;
  // algorithm calculations
  MainCalculation magic;

  // constructor
  Algorithm({@required this.dat}) {
    // @Pattern Strategy
    // what variant of algorithm to use
    magic = _RitesStrategy();
  }

  // result
  Object result() {
    // 1. calculate prophecies by implemented algorithm strategy and given data
    // 2. add user choises if enabled
    // 3. return prophecies
    if (dat.pollAvailability.value == true)
      return magic.calculate(dat).addUserChoises(dat.pollByDateRepo);
    else
      return magic.calculate(dat);
  }
}

extension _UserChoises on Object {
  Object addUserChoises(PollByDateRepository repo) {
    return null;
  }
}

abstract class MainCalculation {
  Object calculate(AlgoData dat);
}

class AlgoData {
  final PollAvailability pollAvailability;
  final PollByDateRepository pollByDateRepo;
  UserEntity user;
  UserPoll currentPoll;

  AlgoData(
      {@required this.pollAvailability,
      @required this.pollByDateRepo,
      @required this.user}) {
    //
    pollByDateRepo.load(user.id);
    currentPoll =
        pollByDateRepo.todayPoll ?? UserPoll(mood: POLL_DEFAULT_INIT_VALUE);
  }
}
