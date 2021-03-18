import 'package:meta/meta.dart';
import 'package:my_prophet/user/repository/interface.dart';
import 'package:my_prophet/prophecy/entity/prophecy.dart';

export 'package:my_prophet/user/repository/interface.dart';
export 'package:my_prophet/prophecy/entity/prophecy.dart';

import 'bgoncharuck/algorithm.dart';

class AlgoData {
  /// repository of users which have a getter of current logged user
  final UsersRepository usersRepository;

  /// current logged user
  UserEntity get user => usersRepository.current;

  AlgoData({@required this.usersRepository});
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
  Algorithm({@required this.dat}) {}
  //

  /// ask for prophecy about given day
  Map<ProphecyType, ProphecyEntity> ask({@required int aboutDay}) {
    return prophet.ask(dat, aboutDay);
  }
}
