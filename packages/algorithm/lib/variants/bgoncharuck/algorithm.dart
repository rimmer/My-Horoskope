import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:users_repository/users_repository.dart';
import 'package:userpoll/userpoll.dart';
import 'package:algorithm/astro.dart';
import 'methods_base.dart';
import 'methods_userpollcalc.dart';
// - - -
import '../../interface.dart';
import '../../astro.dart';
import '../../astro_rome.dart';
import '../../astro_jewish.dart';

// - - -
// hardcoded
part 'base_hardcoded.dart';
// - - -
// astrology
part 'base_astrology.dart';
part 'base_astrology_numerologic.dart';
part 'base_astrology_tarot.dart';

const int DAYS_TO_COUNT_IN_POLLS = 7;
const TODAY_POLL_PERCENT = 5;

abstract class _OldWisdom {
  /// returned map must have values from 1 to 100
  Map<ProphecyType, ProphecyEntity> says(UserEntity aboutUser, int inTimeOf);
}

class OfOldWayMagic implements MagicSpecialization {
  //
  /// Cut the red line here! Here we go
  // final _OldWisdom _mage = _Hardcoded();
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

    if (withDat.user.pollAvailability == true) {
      userWillPower = withDat.pollByDateRepo.curUserPolls.length;

      if (userWillPower > DAYS_TO_COUNT_IN_POLLS)
        userPollsMean =
            withDat.pollByDateRepo.arithmeticMean(DAYS_TO_COUNT_IN_POLLS);
      else
        userPollsMean = withDat.pollByDateRepo.arithmeticMean(userWillPower);
    }

    //
    /// get information from the mage
    final mysticInfo = _askInformation(withDat.user, aboutDay);

    //
    /// if user were weak-willed
    /// return events without any changes
    if (userWillPower == 0 || userPollsMean == null) {
      return mysticInfo;
    }

    /// can be replaced in future
    final userSign = withDat.user.model.birth.astroSign;
    final percentChangeBySign = userSign.choiseConsequenceBySign;

    if (percentChangeBySign == null) {
      print("Error: Astro Methods gave incorrect List");
      return mysticInfo;
    }

    // /// else change userWill to part that will be changed
    // /// mysticInfo - part, change(part) by user choises
    // /// mysticInfo + part
    // if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 4) {
    //   userWillPower = 3;
    // } else if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 3) {
    //   userWillPower = 5;
    // } else if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 2) {
    //   userWillPower = 8;
    // } else {
    //   userWillPower = 13;
    // }

    // /// when part chosen, let us change our mysticInfo
    // final result = changePartsOfBase(
    //   base: mysticInfo,
    //   percent: userWillPower,
    //   userPoll: userPollsMean,
    //   changeBySign: percentChangeBySign,
    // );

    // if (result != null) return result;
    //
    return mysticInfo;
  }

  //
  //
  //
  Map<ProphecyType, ProphecyEntity> clarify(
      {@required Map<ProphecyType, ProphecyEntity> prophecies,
      @required UserEntity user,
      @required UserPoll withPoll}) {
    //
    /// can be replaced in future
    final userSign = user.model.birth.astroSign;
    final percentChangeBySign = userSign.choiseConsequenceBySign;

    if (percentChangeBySign == null) {
      print("Error: Astro Methods gave incorrect List");
      return prophecies;
    }

    // final result = changePartsOfBase(
    //   base: prophecies,
    //   percent: TODAY_POLL_PERCENT,
    //   changeBySign: percentChangeBySign,
    //   userPoll: {
    //     PollModelType.MOOD:
    //         (withPoll.poll(PollModelType.MOOD)).value.toDouble(),
    //     PollModelType.PHYSICAL_ACTIVITY:
    //         (withPoll.poll(PollModelType.PHYSICAL_ACTIVITY)).value.toDouble(),
    //     PollModelType.PRODUCTIVITY:
    //         (withPoll.poll(PollModelType.PRODUCTIVITY)).value.toDouble(),
    //     PollModelType.RELATIONSHIPS:
    //         (withPoll.poll(PollModelType.RELATIONSHIPS)).value.toDouble(),
    //     PollModelType.SELFDEVELOPMENT:
    //         (withPoll.poll(PollModelType.SELFDEVELOPMENT)).value.toDouble(),
    //   },
    // );

    // if (result != null) return result;
    // //
    return prophecies;
  }
}
