import 'package:meta/meta.dart';
import 'package:userpoll/userpoll.dart';
import 'package:pollbydate/pollbydate.dart';
import 'package:users_repository/users_repository.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:prophecies/prophecies.dart';

import 'variants/bgoncharuck/algorithm.dart';

class AlgoData {
  /// repository of {date:poll} relations which is laoded by user id
  final PollByDateRepository pollByDateRepo;
  final UsersRepository usersRepository;
  UserEntity get user => usersRepository.current;

  AlgoData({@required this.pollByDateRepo, @required this.usersRepository});
}

/// Interface for calculation part of algorithm
/// which can be implemented in multiple ways
abstract class Calculate {
  /// calculates the final variant of Map
  Map<ProphecyId, ProphecyEntity> calculate(AlgoData dat);

  /// calculates a new Map after todays poll is added
  Map<ProphecyId, ProphecyEntity> caclulateWithPoll(
      {@required Map<ProphecyId, ProphecyEntity> prophecies,
      @required UserPoll poll});
}

class Algorithm {
  /// implementation of Calculate interface can be changed here
  Calculate calcImpl = RitesStrategy();

  /// stores lastCalculation result
  Map<ProphecyId, ProphecyEntity> lastCalculation;

  final AlgoData dat;
  Algorithm({@required this.dat}) {
    dat.pollByDateRepo.load(dat.user.id);
  }
  //

  /// calculates Map by current data and Calculate implementation
  Map<ProphecyId, ProphecyEntity> calculate() {
    lastCalculation = calcImpl.calculate(dat);
    return lastCalculation;
  }

  /// calculates a new Map after todays poll is added
  Map<ProphecyId, ProphecyEntity> caclulateWithPoll({@required UserPoll poll}) {
    return calcImpl.caclulateWithPoll(
        prophecies: lastCalculation ?? this.calculate(), poll: poll);
  }

  //
  //
  void addText(
      {@required Map<ProphecyId, ProphecyEntity> prophecies,
      @required ProphecyId id,
      @required String text}) {}
}
