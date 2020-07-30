import 'package:meta/meta.dart';
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
    //
    dat.pollByDateRepo.load(dat.user.id);
    dat.currentPoll =
        dat.pollByDateRepo.todayPoll ?? UserPoll(mood: POLL_DEFAULT_INIT_VALUE);
    // @Pattern Strategy
    // what variant of algorithm to use
    magic = _RitesStrategy();
  }

  // result
  Object result({UserEntity user}) {
    // 1. calculate prophecies by implemented algorithm strategy and given data
    // 2. add user choises if enabled
    // 3. return prophecies
    if (dat.user.pollAvailability == true)
      return magic
          .calculate(user ?? dat.user)
          .addUserChoises(dat.pollByDateRepo);
    else
      return magic.calculate(user ?? dat.user);
  }
}

extension _UserChoises on Object {
  Object addUserChoises(PollByDateRepository repo) {
    return null;
  }
}

abstract class MainCalculation {
  Object calculate(UserEntity user);
}

class AlgoData {
  final PollByDateRepository pollByDateRepo;
  final UsersRepository usersRepository;
  UserEntity get user => usersRepository.current;
  UserPoll currentPoll;

  AlgoData({@required this.pollByDateRepo, @required this.usersRepository});
}
