import 'package:meta/meta.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:poll_model/poll_model.dart';

ProphecyEntity changePartOfBase(
    {@required ProphecyEntity base,
    @required int percent,
    @required double pollValue,
    @required List<int> bySign}) {
  //
  //
  /// float value cant be assign to int, bluh, bluh, bluh
  final double _percent = (base.value * percent) / 100;

  //

  base.value -= _percent;

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
  final initPositionValue = (_percent / 7);

  /// here we will find our needed value
  base.value += initPositionValue * position;

  //

  return base;
}

//

//

Map<ProphecyType, ProphecyEntity> changePartsOfBase({
  @required Map<ProphecyType, ProphecyEntity> base,
  @required int percent,
  @required Map<PollModelType, double> userPoll,
  @required Map<ProphecyType, List<int>> changeBySign,
}) {
  /// Future tip: PLEASE, sort prophecies ids in alphabetic order
  ///
  base[ProphecyType.AMBITION] = changePartOfBase(
      base: base[ProphecyType.AMBITION],
      percent: percent,
      pollValue: userPoll[PollModelType.PRODUCTIVITY],
      bySign: changeBySign[ProphecyType.AMBITION]);

  base[ProphecyType.INTELLIGENCE] = changePartOfBase(
      base: base[ProphecyType.INTELLIGENCE],
      percent: percent,
      pollValue: userPoll[PollModelType.SELFDEVELOPMENT],
      bySign: changeBySign[ProphecyType.INTELLIGENCE]);

  base[ProphecyType.INTERNAL_STRENGTH] = changePartOfBase(
      base: base[ProphecyType.INTERNAL_STRENGTH],
      percent: percent,
      pollValue: userPoll[PollModelType.RELATIONSHIPS],
      bySign: changeBySign[ProphecyType.INTERNAL_STRENGTH]);

  base[ProphecyType.LUCK] = changePartOfBase(
      base: base[ProphecyType.LUCK],
      percent: percent,
      pollValue: userPoll[PollModelType.MOOD],
      bySign: changeBySign[ProphecyType.LUCK]);

  base[ProphecyType.MOODLET] = changePartOfBase(
      base: base[ProphecyType.MOODLET],
      percent: percent,
      pollValue: userPoll[PollModelType.PHYSICAL_ACTIVITY],
      bySign: changeBySign[ProphecyType.MOODLET]);

  //

  return base;
}

Map<ProphecyType, ProphecyEntity> dividedByTen(
    Map<ProphecyType, ProphecyEntity> res) {
  res[ProphecyType.INTERNAL_STRENGTH].value /= 10;
  res[ProphecyType.MOODLET].value /= 10;
  res[ProphecyType.AMBITION].value /= 10;
  res[ProphecyType.INTELLIGENCE].value /= 10;
  res[ProphecyType.LUCK].value /= 10;
  return res;
}
