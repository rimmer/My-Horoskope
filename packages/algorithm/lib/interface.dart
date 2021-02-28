import 'package:meta/meta.dart';
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
}

class Algorithm {
  /// here you can change a specialization of your prophet
  MagicSpecialization prophet = OfOldWayMagic();

  final AlgoData dat;
  Algorithm({@required this.dat}) {
    /// loads {date:poll} for currenct user
    dat.pollByDateRepo.load(dat.user.id);
  }
  //

  /// ask for prophecy about given day
  Map<ProphecyType, ProphecyEntity> ask({@required int aboutDay}) {
    return prophet.ask(dat, aboutDay);
  }
}
