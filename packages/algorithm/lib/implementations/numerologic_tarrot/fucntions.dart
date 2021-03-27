import 'package:base/prophecy/entity/prophecy.dart';
import 'sheets.dart' show astroSignToDayOfWeek;
import 'package:base/int_datetime.dart' show BasicAstrology;

/// in: 26, out: 8
///
/// in: 14, out: 5
///
/// 2+6 = 8
///
/// 1+4= 5
///
/// in: 29, out: 2
///
/// 2+9=11, 11>9, 1+1= 2
int numerologicUnion(int number) {
  /// list of digits in number
  List<int> digits =
      (number.toString().split('')).map((e) => int.parse(e)).toList();

  int union = 0;
  digits.forEach((digit) {
    union += digit;
  });

  /// recursion, if number has 2 or more digits left (10, 11..)
  if (union <= 9)
    return union;
  else
    return numerologicUnion(union);
}

int dayOfWeekDiff(DateTime birthDate, DateTime cur, {int addition = 0}) {
  int dif = (cur.difference(birthDate)).inDays;
  dif += addition;

  return dif % 7;
}

/// 5, 10, 15..30, with bonus 34
int dayOfWeekCalc(DateTime birthDate, DateTime cur, ProphecyType prophecy) {
  int addition;

  switch (prophecy) {
    case ProphecyType.INTERNAL_STRENGTH:
      addition = 1;
      break;

    case ProphecyType.MOODLET:
      addition = 6;
      break;

    case ProphecyType.AMBITION:
      addition = 5;
      break;

    case ProphecyType.INTUITION:
      addition = 2;
      break;

    case ProphecyType.LUCK:
      addition = 3;
      break;
  }

  final base = dayOfWeekDiff(birthDate, cur, addition: addition) * 5;

  /// bonus 4 points
  if (astroSignToDayOfWeek[birthDate.millisecondsSinceEpoch.astroSign] ==
      cur.weekday) return base + 4;

  return base;
}

/// in: day of a month (from 1 to 31), birthdaay and current days
/// out: multiple of 4, 9 numbers: 36, 32, 28, 24.. 8, 4
/// if numerologic union of birthday and curDay is equal, then 36
int moodIntuitionLuckBase(int birthDay, int currentDay) {
  int birthUnion = numerologicUnion(birthDay);
  int curUnion = numerologicUnion(currentDay);

  if (birthUnion == curUnion) return 36;

  int dif = curUnion - birthUnion;
  if (dif < 0) dif *= -1;

  /// if dif == 3,
  /// then impact is 24
  /// if dif is much bigger, like 8
  /// then impact is only 4
  /// 36- dif*4= 36-8*4= 4
  return 36 - dif * 4;
}
