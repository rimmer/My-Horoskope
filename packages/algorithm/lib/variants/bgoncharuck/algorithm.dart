import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:users_repository/users_repository.dart';
import 'package:userpoll/userpoll.dart';
import 'package:polls_repository/polls_repository.dart';
import '../../interface.dart';

part 'base_hardcoded.dart';

const int DAYS_TO_COUNT_IN_POLLS = 7;

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

  /// everyone makes choices in their lives
  /// these choices lead to the aftermath
  /// (calculates user polls arithmetic mean
  /// and have values from 1 to 6)
  Map<ProphecyId, ProphecyEntity> _freeWillConsequence(PollsRepository repo) {
    final meanOf = repo.arithmeticMean(DAYS_TO_COUNT_IN_POLLS);
    if (meanOf == null) return /*map with zero values*/ Prophecies();
    //
    return {
      //
      ProphecyId.LUCK: ProphecyEntity(
          id: ProphecyId.LUCK,
          //
          value: meanOf[PollModelType.MOOD]),
      //
      //
      ProphecyId.INTERNAL_STRENGTH: ProphecyEntity(
          id: ProphecyId.INTERNAL_STRENGTH,
          //
          value: meanOf[PollModelType.RELATIONSHIPS]),
      //
      //
      ProphecyId.MOODLET: ProphecyEntity(
          id: ProphecyId.MOODLET,
          //
          value: meanOf[PollModelType.PHYSICAL_ACTIVITY]),
      //
      //
      ProphecyId.AMBITION: ProphecyEntity(
          id: ProphecyId.AMBITION,
          //
          value: meanOf[PollModelType.PRODUCTIVITY]),
      //
      //
      ProphecyId.INTELLIGENCE: ProphecyEntity(
          id: ProphecyId.INTELLIGENCE,
          //
          value: meanOf[PollModelType.SELFDEVELOPMENT]),
      //
    };
  }

  //
  /// Old Way Magic will use an information given by a mage and user choices
  /// to return a correct prophecy for a prophet, that asked for it
  Map<ProphecyId, ProphecyEntity> ask(AlgoData withDat, int aboutDay) {
    //
    /// will store a user polls arithmetic mean or object with zero values
    final aftermath = (withDat.user.pollAvailability == true)
        ? _freeWillConsequence(withDat.pollByDateRepo)
        : Prophecies(); // object with 0 values

    //
    //
    /// how much polls were voted, and the part that be changed in the future
    var userWillPower = (withDat.user.pollAvailability == true)
        ? withDat.pollByDateRepo.curUserPolls.length
        : 0;

    //
    /// get information from the mage
    final mysticInfo = _askInformation(withDat.user, aboutDay);

    //
    //
    /// if user were weak-willed
    /// return events without any changes
    if (userWillPower == 0) {
      mysticInfo[ProphecyId.INTERNAL_STRENGTH].value /= 10;
      mysticInfo[ProphecyId.MOODLET].value /= 10;
      mysticInfo[ProphecyId.AMBITION].value /= 10;
      mysticInfo[ProphecyId.INTELLIGENCE].value /= 10;
      mysticInfo[ProphecyId.LUCK].value /= 10;
      return mysticInfo;
      //
      //
    }

    /// else change userWill to part that will be changed
    /// mysticInfo - part, change(part) by user choises
    /// mysticInfo + part
    else if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 4) {
      userWillPower = 8;
    } else if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 3) {
      userWillPower = 13;
    } else if (userWillPower < DAYS_TO_COUNT_IN_POLLS / 2) {
      userWillPower = 21;
    }
    // else if userWillPower >= days_to_count
    //
    userWillPower = 34;

    //
  }

  //
  //
  //
  Map<ProphecyId, ProphecyEntity> clarify(
          {@required Map<ProphecyId, ProphecyEntity> prophecies,
          @required UserPoll withPoll}) =>
      {};
}
