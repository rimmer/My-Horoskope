import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:users_repository/users_repository.dart';
import 'package:userpoll/userpoll.dart';
import 'package:algorithm/astro.dart';
import 'methods_userpollcalc.dart';
import '../../interface.dart';

part 'base_hardcoded.dart';

const int DAYS_TO_COUNT_IN_POLLS = 7;
const TODAY_POLL_PERCENT = 10;

abstract class _OldWisdom {
  /// returned map must have values from 1 to 100
  Map<ProphecyId, ProphecyEntity> says(UserEntity aboutUser, int inTimeOf);
}

class OfOldWayMagic implements MagicSpecialization {
  //
  final _OldWisdom _mage = _Hardcoded();

  /// asks information from the Old Way adept mage
  Map<ProphecyId, ProphecyEntity> _askInformation(
          UserEntity aboutUser, int inTimeOf) =>
      _mage.says(aboutUser, inTimeOf);

  //
  /// Old Way Magic will use an information given by a mage and user choices
  /// to return a correct prophecy for a prophet, that asked for it
  Map<ProphecyId, ProphecyEntity> ask(AlgoData withDat, int aboutDay) {
    //
    /// how much polls were voted, and the part that be changed in the future
    int userWillPower;

    /// will store a user polls arithmetic mean
    Map<PollModelType, double> userPollsMean;

    if (withDat.user.pollAvailability == true) {
      userWillPower = withDat.pollByDateRepo.curUserPolls.length;
      userPollsMean =
          withDat.pollByDateRepo.arithmeticMean(DAYS_TO_COUNT_IN_POLLS);
    }

    //
    /// get information from the mage
    final mysticInfo = _askInformation(withDat.user, aboutDay);

    //
    /// if user were weak-willed
    /// return events without any changes
    if (userWillPower == 0 || userPollsMean == null) {
      return dividedByTen(mysticInfo);
    }

    /// can be replaced in future
    final userSign = withDat.user.model.birth.astroSign;
    final percentChangeBySign = userSign.choiseConsequenceBySign;

    if (percentChangeBySign == null) {
      print("Error: Astro Methods gave incorrect List");
      return dividedByTen(mysticInfo);
    }

    /// else change userWill to part that will be changed
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

    if (result != null) return dividedByTen(result);
    //
    return dividedByTen(mysticInfo);
  }

  //
  //
  //
  Map<ProphecyId, ProphecyEntity> clarify(
      {@required Map<ProphecyId, ProphecyEntity> prophecies,
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

    final result = changePartsOfBase(
      base: prophecies,
      percent: TODAY_POLL_PERCENT,
      userPoll: {
        // @TODO
        // 1. This
        // 2. bloc
        // 3. prophecies list widget
      },
      changeBySign: percentChangeBySign,
    );

    if (result != null) return result;
    //
    return prophecies;
  }
}
