import 'package:poll_model/poll_model.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:users_repository/users_repository.dart';
import 'package:algorithm/astro.dart';
import 'methods_base.dart';
import 'methods_userpollcalc.dart';
// - - -
import '../../interface.dart';
import '../../astro.dart';
import '../../astro_rome.dart';
import '../../astro_jewish.dart';

// - - -
// astrology
part 'base_astrology.dart';
part 'base_astrology_numerologic.dart';
part 'base_astrology_tarot.dart';

const int DAYS_TO_COUNT_IN_POLLS = 7;
const TODAY_POLL_PERCENT = 10;

abstract class _OldWisdom {
  /// returned map must have values from 1 to 100
  Map<ProphecyType, ProphecyEntity> says(UserEntity aboutUser, int inTimeOf);
}

class OfOldWayMagic implements MagicSpecialization {
  //
  /// Cut the red line here! Here we go
  final _OldWisdom _mage = _Astrology();

  /// asks information from the Old Way adept mage
  Map<ProphecyType, ProphecyEntity> _askInformation(
          UserEntity aboutUser, int inTimeOf) =>
      _mage.says(aboutUser, inTimeOf);

  //
  /// Old Way Magic will use an information given by a mage and user choices
  /// to return a correct prophecy for a prophet, that asked for it
  Map<ProphecyType, ProphecyEntity> ask(AlgoData withDat, int aboutDay) {
    //
    /// how much polls were voted, and the part that be changed in the future
    int userWillPower;

    /// will store a user polls arithmetic mean
    Map<PollModelType, double> userPollsMean;

    userWillPower = withDat.pollByDateRepo.curUserPolls.length;

    if (userWillPower > DAYS_TO_COUNT_IN_POLLS)
      userPollsMean =
          withDat.pollByDateRepo.arithmeticMean(DAYS_TO_COUNT_IN_POLLS);
    else
      userPollsMean = withDat.pollByDateRepo.arithmeticMean(userWillPower);

    //
    /// get information from the mage
    final mysticInfo = _askInformation(withDat.user, aboutDay);

    //
    /// if user did not vote
    /// return votes without any changes
    if (userPollsMean == null) {
      return mysticInfo;
    }

    /// can be replaced in future
    final userSign = withDat.user.model.birth.astroSign;
    final percentChangeBySign = userSign.choiseConsequenceBySign;

    if (percentChangeBySign == null) {
      return mysticInfo;
    }

    /// change userWill to part that will be changed
    /// mysticInfo - part, change(part) by user choises
    /// mysticInfo + part
    if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 4) {
      userWillPower = 5;
    } else if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 3) {
      userWillPower = 8;
    } else if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 2) {
      userWillPower = 13;
    } else {
      userWillPower = 21;
    }

    /// when part chosen, let us change our mysticInfo
    final result = changePartsOfBase(
      base: mysticInfo,
      percent: userWillPower,
      userPoll: userPollsMean,
      changeBySign: percentChangeBySign,
    );

    if (result != null) return result;

    return mysticInfo;
  }
}
