part of 'algorithm.dart';

class _Astrology implements _OldWisdom {
  Map<ProphecyType, ProphecyEntity> says(UserEntity aboutUser, int inTimeOf) {
    //
  }
}

int dayOfWeekCalc(DateTime birthDate, DateTime cur, ProphecyType prophecy) {}

/// in: day of a month (from 1 to 31), birthdaay and current days
/// out: multiple of 4, 9 numbers: 36, 32, 28, 24.. 8, 4
/// if numerologic union of birthday and curDay is equal, then 36
int _moodIntelLuckBase(int birthDay, int currentDay) {
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

/// unique month impact for every sign
/// multiple of 3, 12 monthes
/// 3, 6, 9.. 36
class _InternalStrAmbitionBase {
  static const Map<String, Map<int, int>> mapSignAndMonthToValue = {
    "Aries": {
      1: 18,
      2: 21,
      3: 6,
      4: 36,
      5: 12,
      6: 24,
      7: 9,
      8: 30,
      9: 15,
      10: 27,
      11: 3,
      12: 33,
    },
    "Taurus": {
      1: 30,
      2: 9,
      3: 24,
      4: 12,
      5: 36,
      6: 6,
      7: 21,
      8: 18,
      9: 33,
      10: 3,
      11: 27,
      12: 15,
    },
    "Gemini": {
      1: 3,
      2: 33,
      3: 18,
      4: 21,
      5: 6,
      6: 36,
      7: 12,
      8: 24,
      9: 9,
      10: 30,
      11: 15,
      12: 27,
    },
    "Cancer": {
      1: 27,
      2: 15,
      3: 30,
      4: 9,
      5: 24,
      6: 12,
      7: 36,
      8: 6,
      9: 21,
      10: 18,
      11: 33,
      12: 3,
    },
    "Leo": {
      1: 15,
      2: 27,
      3: 3,
      4: 33,
      5: 18,
      6: 21,
      7: 6,
      8: 36,
      9: 12,
      10: 24,
      11: 9,
      12: 30,
    },
    "Virgo": {
      1: 33,
      2: 3,
      3: 27,
      4: 15,
      5: 30,
      6: 9,
      7: 24,
      8: 12,
      9: 36,
      10: 6,
      11: 21,
      12: 18,
    },
    "Libra": {
      1: 9,
      2: 30,
      3: 15,
      4: 27,
      5: 3,
      6: 33,
      7: 18,
      8: 21,
      9: 6,
      10: 36,
      11: 12,
      12: 24,
    },
    "Scorpio": {
      1: 21,
      2: 18,
      3: 33,
      4: 3,
      5: 27,
      6: 15,
      7: 30,
      8: 9,
      9: 24,
      10: 12,
      11: 36,
      12: 6,
    },
    "Sagittarius": {
      1: 12,
      2: 24,
      3: 9,
      4: 30,
      5: 15,
      6: 27,
      7: 3,
      8: 33,
      9: 18,
      10: 21,
      11: 6,
      12: 36,
    },
    "Capricorn": {
      1: 36,
      2: 6,
      3: 21,
      4: 18,
      5: 33,
      6: 3,
      7: 27,
      8: 15,
      9: 30,
      10: 9,
      11: 24,
      12: 12,
    },
    "Aquarius": {
      1: 6,
      2: 36,
      3: 12,
      4: 24,
      5: 9,
      6: 30,
      7: 15,
      8: 27,
      9: 3,
      10: 33,
      11: 18,
      12: 21,
    },
    "Pisces": {
      1: 24,
      2: 12,
      3: 36,
      4: 6,
      5: 21,
      6: 18,
      7: 33,
      8: 3,
      9: 27,
      10: 15,
      11: 30,
      12: 9,
    },
  };
}
