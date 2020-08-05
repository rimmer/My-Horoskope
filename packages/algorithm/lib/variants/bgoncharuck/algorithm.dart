import 'package:meta/meta.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:users_repository/users_repository.dart';
import 'package:userpoll/userpoll.dart';
import 'package:pollbydate/pollbydate.dart';
import '../../interface.dart';

part 'base_hardcoded.dart';

/// Calculates basic prophecies object for a given user
/// it can't be used in app
/// and have values from 1 to 100
abstract class _CalculateTheBase {
  Map<ProphecyId, ProphecyEntity> calculate(UserEntity user);
}

class RitesStrategy implements Calculate {
  //
  final _CalculateTheBase _baseCalcImpl = _HardcodedStrategy();

  /// calculates a basic object by given implementation
  Map<ProphecyId, ProphecyEntity> _calculateUser(UserEntity user) =>
      _baseCalcImpl.calculate(user);

  /// calculates user polls arithmetic mean
  /// it can't be used in app
  /// and have values from 1 to 6
  Map<ProphecyId, ProphecyEntity> _userPollsMean(PollByDateRepository repo) =>
      {};

  //
  //
  /// Final calculations goes here
  Map<ProphecyId, ProphecyEntity> calculate(AlgoData dat) {
    //
    /// will store a user polls arithmetic mean or object with zero values
    final userPolls = (dat.user.pollAvailability == true)
        ? _userPollsMean(dat.pollByDateRepo)
        : Prophecies();

    //
    //
    /// how much polls were voted
    final userPollsPower = (dat.user.pollAvailability == true)
        ? dat.pollByDateRepo.currentUserPolls.date.length
        : 0;

    //
    //
    final base = _calculateUser(dat.user);

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

  //
  //
  //
  //
  Map<ProphecyId, ProphecyEntity> caclulateWithPoll(
          {@required Map<ProphecyId, ProphecyEntity> prophecies,
          @required AlgoData dat}) =>
      {};
}
