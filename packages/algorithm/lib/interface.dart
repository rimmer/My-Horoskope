import 'package:meta/meta.dart';
import 'package:userpoll/userpoll.dart';
import 'package:pollbydate/pollbydate.dart';
import 'package:users_repository/users_repository.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:impact_model/impact_model.dart';
import 'package:prophecies/prophecies.dart';

part 'variants/algorithm_hardcoded.dart';
part 'variants/algorithm_bgoncharuck.dart';
part 'variants/algorithm_bbks.dart';

class AlgoData {
  /// repository of {date:poll} relations which is laoded by user id
  final PollByDateRepository pollByDateRepo;
  final UsersRepository usersRepository;
  UserEntity get user => usersRepository.current;
  UserPoll currentPoll;

  AlgoData({@required this.pollByDateRepo, @required this.usersRepository});
}

/// Takes out the calculation method from the Algorithm class in a separate interface and its implementations.
abstract class CalculateTheBase {
  /// Calculates basic prophecies object for a given user
  /// it can't be used in app
  /// and have values from 1 to 100
  Map<ProphecyId, ProphecyEntity> calculate(UserEntity user);
}

class Algorithm {
  Map<ProphecyId, ProphecyEntity> calculate({UserEntity user}) {
    //
    //
    /// will store a user polls calculation result or object with zero values
    final userPolls = (dat.user.pollAvailability == true)
        ? _userPollsCalculation()
        : Prophecies();

    //
    //
    /// how much polls exist
    final userPollsPower = (dat.user.pollAvailability == true)
        ? dat.pollByDateRepo.currentUserPolls.date.length
        : 0;

    //
    //
    final base = _calculateTheBase(user ?? dat.user);

    //
    //
    if (userPollsPower == 0) {
      base[ProphecyId.INTERNAL_STRENGTH].value /= 10;
      base[ProphecyId.MOODLET].value /= 10;
      base[ProphecyId.AMBITION].value /= 10;
      base[ProphecyId.INTELLIGENCE].value /= 10;
      base[ProphecyId.LUCK].value /= 10;
      return base;
    }
  }

//---------------------------------------------------------------------------
  //
  //
  /// you can change implementation here
  final CalculateTheBase _baseCalcImpl = _HardcodedStrategy();

  //
  //
  /// calculates a basic object by given implementation
  Map<ProphecyId, ProphecyEntity> _calculateTheBase(UserEntity user) =>
      _baseCalcImpl.calculate(user);

  //
  //
  //
  //
  final AlgoData dat;
  Algorithm({@required this.dat}) {
    dat.pollByDateRepo.load(dat.user.id);
    dat.currentPoll =
        dat.pollByDateRepo.todayPoll ?? UserPoll(mood: POLL_DEFAULT_INIT_VALUE);
  }

  //
  //
  //
  //
  /// calculates user polls
  /// it can't be used in app
  /// and have values from 1 to 100
  Map<ProphecyId, ProphecyEntity> _userPollsCalculation() => {};

  //
  //
  //
  //
  Map<ProphecyId, ProphecyEntity> addCurrentPoll(
          Map<ProphecyId, ProphecyEntity> prophecies) =>
      {};

  //
  //
  //
  //
  void addText(Map<ProphecyId, ProphecyEntity> prophecies,
      {@required double value,
      @required ProphecyId id,
      @required String text}) {}
}
