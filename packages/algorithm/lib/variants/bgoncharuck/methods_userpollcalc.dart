import 'package:meta/meta.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:poll_model/poll_model.dart';

ProphecyEntity changePartOfBase(
    {@required ProphecyEntity base,
    @required int percent,
    @required double pollValue,
    @required List<int> bySign}) {
  base.value -= percent;

  /// possible values:
  /// -6, -5, -4, -3, -2, -1. 0, +1, +2, +3, +4, +5, +6
  /// number of values equal to 13
  /// 0 is seven position out of 13 positions
  /// or 7/13
  ///
  /// percent is equal to zero value
  /// percent = 7/13
  ///
  /// our new value is x out of 13
  ///
  /// we divide our percent on 7 parts,
  /// to get correct value for one position
  /// based on our percent
  ///
  /// then we multiply our correct value of percent by multiplier

  /// every astrologic sign has his own unique position
  /// for every vote of every poll by indificator of pole
  ///
  /// PollType: [votedOne, votedTwo, votedThree, votedFour, votedFive, votedSix]
  ///
  /// this list is array of integers with 6 elements (0-5)
  /// with values from 1 to 13

  /// here we choose a position by the index
  /// of given poll value - 1
  final position = bySign[(pollValue >= 3.0)

      /// for poll values over 3 ceil, to get max value if person voted mostly positive
      ? pollValue.ceil() - 1

      /// for poll values under 3 floor, to get minimal value if person voted mostly negative
      : pollValue.floor() - 1];

  //

  /// here we find our initial position
  /// percent = 7/13
  /// 1/13 = percent/7 / 13
  final initPositionValue = (percent / 7);

  /// here we find our needed value
  base.value += initPositionValue * position;

  //

  return base;
}

//

//

Map<ProphecyId, ProphecyEntity> changePartsOfBase({
  @required Map<ProphecyId, ProphecyEntity> base,
  @required int percent,
  @required Map<PollModelType, double> userPoll,
  @required Map<ProphecyId, List<int>> changeBySign,
}) {
  /// Future tip: PLEASE, sort prophecies ids in alphabetic order
  ///
  base[ProphecyId.AMBITION] = changePartOfBase(
      base: base[ProphecyId.AMBITION],
      percent: percent,
      pollValue: userPoll[PollModelType.PRODUCTIVITY],
      bySign: changeBySign[ProphecyId.AMBITION]);

  base[ProphecyId.INTELLIGENCE] = changePartOfBase(
      base: base[ProphecyId.INTELLIGENCE],
      percent: percent,
      pollValue: userPoll[PollModelType.SELFDEVELOPMENT],
      bySign: changeBySign[ProphecyId.INTELLIGENCE]);

  base[ProphecyId.INTERNAL_STRENGTH] = changePartOfBase(
      base: base[ProphecyId.INTERNAL_STRENGTH],
      percent: percent,
      pollValue: userPoll[PollModelType.RELATIONSHIPS],
      bySign: changeBySign[ProphecyId.INTERNAL_STRENGTH]);

  base[ProphecyId.LUCK] = changePartOfBase(
      base: base[ProphecyId.LUCK],
      percent: percent,
      pollValue: userPoll[PollModelType.MOOD],
      bySign: changeBySign[ProphecyId.LUCK]);

  base[ProphecyId.MOODLET] = changePartOfBase(
      base: base[ProphecyId.MOODLET],
      percent: percent,
      pollValue: userPoll[PollModelType.PHYSICAL_ACTIVITY],
      bySign: changeBySign[ProphecyId.MOODLET]);

  //

  return base;
}

Map<ProphecyId, ProphecyEntity> dividedByTen(
    Map<ProphecyId, ProphecyEntity> res) {
  res[ProphecyId.INTERNAL_STRENGTH].value /= 10;
  res[ProphecyId.MOODLET].value /= 10;
  res[ProphecyId.AMBITION].value /= 10;
  res[ProphecyId.INTELLIGENCE].value /= 10;
  res[ProphecyId.LUCK].value /= 10;
  return res;
}
