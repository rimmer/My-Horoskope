import 'package:int_datetime/int_datetime.dart';
import 'package:meta/meta.dart';
import 'package:userpoll/userpoll.dart';
import 'package:polls_repository/polls_repository.dart';
import 'package:users_repository/users_repository.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:prophecies/prophecies.dart';

import 'variants/bgoncharuck/algorithm.dart';

class AlgoData {
  /// repository of {date:poll} relations which must be loaded by user id
  final PollsRepository pollByDateRepo;

  /// repository of users which have a getter of current logged user
  final UsersRepository usersRepository;

  /// current logged user
  UserEntity get user => usersRepository.current;

  AlgoData({@required this.pollByDateRepo, @required this.usersRepository});
}

/// Interface for a school of magic that can reveal future
abstract class MagicSpecialization {
  /// gives a prophecy
  Map<ProphecyType, ProphecyEntity> ask(AlgoData withDat, int aboutDay);

  /// clarifies a prophecy with a today user poll
  Map<ProphecyType, ProphecyEntity> clarify(
      {@required Map<ProphecyType, ProphecyEntity> prophecies,
      @required UserEntity user,
      @required UserPoll withPoll});
}

class Algorithm {
  /// here you can change a specialization of your prophet
  MagicSpecialization prophet = OfOldWayMagic();

  /// the last insights that were written by the prophet
  Map<ProphecyType, ProphecyEntity> curSessionInsight;

  final AlgoData dat;
  Algorithm({@required this.dat}) {
    /// loads {date:poll} for currenct user
    dat.pollByDateRepo.load(dat.user.id);
  }
  //

  /// ask for prophecy about given day
  Map<ProphecyType, ProphecyEntity> ask({@required int aboutDay}) {
    curSessionInsight = prophet.ask(dat, aboutDay);
    return curSessionInsight;
  }

  /// clarifies a prophecy
  Map<ProphecyType, ProphecyEntity> clarify({
    @required UserPoll withPoll,
    UserEntity user,
    int dt,
  }) {
    return prophet.clarify(
      withPoll: withPoll ?? dat.pollByDateRepo.todayPoll,
      user: user ?? dat.user,
      prophecies: curSessionInsight ??

          /// if no insight were recorded by a prophet
          /// wake him up and force to get another one
          prophet.ask(dat, dt ?? dtDay),
    );
  }
}
