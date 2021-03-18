// all astrology was created for this months
// and now we have 12, not 10 months
// it is a quite stupid problem
// enum RomMonAncient {
//   Martius,
//   Aprilis,
//   Maius,
//   Junius,
//   Quintilis,
//   Sextilis,
//   September,
//   October,
//   November,
//   December,
// None,
// }

import 'package:my_prophet/prophecy/entity/prophecy.dart';

enum RomGod {
  None,
  Mars,
  Venus,
  Mercury,
  Luna,
  Helios,
  Pluto,
  Jupiter,
  Saturn,
  Uranus,
  Neptune,
}

// this relation is best, but we can't use it
// const AncientRomMonthToGod = {
//   RomMonAncient.Martius: RomGod.Mars,
//   RomMonAncient.Aprilis: RomGod.Venus,
//   RomMonAncient.Maius: RomGod.Mercury,
//   RomMonAncient.Junius: RomGod.Luna,
//   RomMonAncient.Quintilis: RomGod.Helios,
//   RomMonAncient.Sextilis: RomGod.Uranus,
//   RomMonAncient.September: RomGod.Neptune,
//   RomMonAncient.October: RomGod.Pluto,
//   RomMonAncient.November: RomGod.Jupiter,
//   RomMonAncient.December: RomGod.Saturn,
// };

// we cant use it too, because calendar was shifted in XV century
// const RomMonthToGodJulianCalendar = {
// RomMon.Martius: RomGod.Mars,
// RomMon.Aprilis: RomGod.Venus,
// RomMon.Maius: RomGod.Mercury,
// RomMon.Iunius: RomGod.Luna,
// RomMon.Quintilis: RomGod.Helios,
// Mercury used again because 2 months were added
// and romans did not approve new gods with unique months
// RomMon.Sextilis: RomGod.Mercury,
// same with Venus
// RomMon.September: RomGod.Venus,
// RomMon.October: RomGod.Pluto,
// RomMon.November: RomGod.Jupiter,
// RomMon.December: RomGod.Saturn,
// RomMon.Ianuarius: RomGod.Uranus,
// RomMon.Februarius: RomGod.Neptune,
// };

/// Month names have incorrect relationship
/// to the God's name and Greek/Rome astrology
/// but, this is what we use, because of
/// 2 calendar changes
const RomMonthToGod = {
  RomMon.Martius: RomGod.Neptune,
  RomMon.Aprilis: RomGod.Mars,
  RomMon.Maius: RomGod.Venus,
  RomMon.Iunius: RomGod.Mercury,
  RomMon.Quintilis: RomGod.Luna,
  RomMon.Sextilis: RomGod.Helios,
  RomMon.September: RomGod.Mercury,
  RomMon.October: RomGod.Venus,
  RomMon.November: RomGod.Pluto,
  RomMon.December: RomGod.Jupiter,
  RomMon.Ianuarius: RomGod.Saturn,
  RomMon.Februarius: RomGod.Uranus,
};

/// Julian Calendar Names
enum RomMon {
  Ianuarius,
  Februarius,
  Martius,
  Aprilis,
  Maius,
  Iunius,
  Quintilis,
  Sextilis,
  September,
  October,
  November,
  December,
}

extension RomePatron on DateTime {
  RomGod get patron {
    //

    RomMon patron = RomMon.December;

    switch (this.month) {
      case 1:
        patron = RomMon.Ianuarius;
        break;

      case 2:
        patron = RomMon.Februarius;
        break;

      case 3:
        patron = RomMon.Martius;
        break;

      case 4:
        patron = RomMon.Aprilis;
        break;

      case 5:
        patron = RomMon.Maius;
        break;

      case 6:
        patron = RomMon.Iunius;
        break;

      case 7:
        patron = RomMon.Quintilis;
        break;

      case 8:
        patron = RomMon.Sextilis;
        break;

      case 9:
        patron = RomMon.September;
        break;

      case 10:
        patron = RomMon.October;
        break;

      case 11:
        patron = RomMon.November;
        break;

      case 12:
      default:
        break;
    }

    return RomMonthToGod[patron];
  }
}

enum TarotSuit { Wands, Pentacles, Swords, Cups }

TarotSuit elementToTarotSuit(String element) {
  TarotSuit suit;

  if (element == "Fire")
    suit = TarotSuit.Wands;
  else if (element == "Earth")
    suit = TarotSuit.Pentacles;
  else if (element == "Air")
    suit = TarotSuit.Swords;
  else if (element == "Water") suit = TarotSuit.Cups;

  return suit;
}

/// unique month impact for every sign
/// multiple of 3, 12 monthes
/// 3, 6, 9.. 36
class InternalStrAmbitionBase {
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

const Map<String, int> astroSignToDayOfWeek = {
  "Aries": 2,
  "Taurus": 5,
  "Gemini": 3,
  "Cancer": 1,
  "Leo": 7,
  "Virgo": 3,
  "Libra": 5,
  "Scorpio": 2,
  "Sagittarius": 4,
  "Capricorn": 6,
  // Aquarius is under Uranus and Saturn, but I place Jupiter here,
  // Jupiter is Thursday
  "Aquarius": 4,
  // "Aquarius": 6,
  "Pisces": 1,
};

/// use Kabbalah and Calestial Tarot
/// connects it with roman (greek) astrology
/// will give from 48 to 52 points (2.1 - 4.2) to every prophecy
///
/// minor - 56
/// probability: 1/56
///
/// full - 78
/// probability: 3/78 == 1/26
///
/// major - 22
/// probability; 2/22 == 1/11
///
/// total probability of patron match: 1179/8008 ?= 1/7
///
/// if any patron matched the sign, then
/// all prophecy values get:
/// if minor: +52
/// if full: +46
/// if major: +42
///
/// if no patron matched,
/// ordinaryImpact must be used
///
class Kabbalah {
  //

  /// it must be counted from 1, but we will do
  /// a mod opertion and will start from 0
  static const patronMinor = {
    0: RomGod.None,
    1: RomGod.None,
    2: RomGod.None,
    3: RomGod.None,
    4: RomGod.None,
    5: RomGod.None,
    6: RomGod.None,
    7: RomGod.None,
    8: RomGod.None,
    9: RomGod.None,
    10: RomGod.None,

    /// Sagittarius
    11: RomGod.Jupiter,

    /// Leo
    12: RomGod.Helios,

    /// Aries
    13: RomGod.Mars,
    //

    14: RomGod.None,
    15: RomGod.None,
    16: RomGod.None,
    17: RomGod.None,
    18: RomGod.None,
    19: RomGod.None,
    20: RomGod.None,
    21: RomGod.None,
    22: RomGod.None,
    23: RomGod.None,
    24: RomGod.None,

    /// Virgo
    25: RomGod.Mercury,

    /// Taurus
    26: RomGod.Venus,

    /// Capricorn
    27: RomGod.Saturn,
    //

    28: RomGod.None,
    29: RomGod.None,
    30: RomGod.None,
    31: RomGod.None,
    32: RomGod.None,
    33: RomGod.None,
    34: RomGod.None,
    35: RomGod.None,
    36: RomGod.None,
    37: RomGod.None,
    38: RomGod.None,

    /// Gemini
    39: RomGod.Mercury,

    /// Aquarius
    40: RomGod.Uranus,

    /// Libra
    41: RomGod.Venus,
    //

    42: RomGod.None,
    43: RomGod.None,
    44: RomGod.None,
    45: RomGod.None,
    46: RomGod.None,
    47: RomGod.None,
    48: RomGod.None,
    49: RomGod.None,
    50: RomGod.None,
    51: RomGod.None,
    52: RomGod.None,

    /// Pisces
    53: RomGod.Neptune,

    /// Scorpio
    54: RomGod.Pluto,

    /// Cancer
    55: RomGod.Luna
  };

  static const patronFull = {
    0: RomGod.Mercury,
    1: RomGod.Luna,
    2: RomGod.Venus,
    3: RomGod.Mars,
    4: RomGod.Venus,
    5: RomGod.Mercury,
    6: RomGod.Luna,
    7: RomGod.Helios,
    8: RomGod.Mercury,
    9: RomGod.Jupiter,
    10: RomGod.Venus,
    11: RomGod.Neptune,
    12: RomGod.Pluto,
    13: RomGod.Jupiter,
    14: RomGod.Saturn,
    15: RomGod.Mars,
    16: RomGod.Uranus,
    17: RomGod.Neptune,
    18: RomGod.Helios,
    19: RomGod.Pluto,
    20: RomGod.Uranus,
    21: RomGod.Saturn,
    //

    22: RomGod.None,
    23: RomGod.None,
    24: RomGod.None,
    25: RomGod.None,
    26: RomGod.None,
    27: RomGod.None,
    28: RomGod.None,
    29: RomGod.None,
    30: RomGod.None,
    31: RomGod.None,
    32: RomGod.None,

    //
    33: RomGod.Jupiter,
    34: RomGod.Helios,
    35: RomGod.Mars,
    //

    36: RomGod.None,
    37: RomGod.None,
    38: RomGod.None,
    39: RomGod.None,
    40: RomGod.None,
    41: RomGod.None,
    42: RomGod.None,
    43: RomGod.None,
    44: RomGod.None,
    45: RomGod.None,
    46: RomGod.None,

    //
    47: RomGod.Mercury,
    48: RomGod.Venus,
    49: RomGod.Saturn,
    //

    50: RomGod.None,
    51: RomGod.None,
    52: RomGod.None,
    53: RomGod.None,
    54: RomGod.None,
    55: RomGod.None,
    56: RomGod.None,
    57: RomGod.None,
    58: RomGod.None,
    59: RomGod.None,
    60: RomGod.None,

    //
    61: RomGod.Mercury,
    62: RomGod.Uranus,
    63: RomGod.Venus,
    //

    64: RomGod.None,
    65: RomGod.None,
    66: RomGod.None,
    67: RomGod.None,
    68: RomGod.None,
    69: RomGod.None,
    70: RomGod.None,
    71: RomGod.None,
    72: RomGod.None,
    73: RomGod.None,
    74: RomGod.None,

    //
    75: RomGod.Neptune,
    76: RomGod.Pluto,
    77: RomGod.Luna,
  };

  static const patronMajor = {
    0: RomGod.Mercury,
    1: RomGod.Luna,
    2: RomGod.Venus,
    3: RomGod.Mars,
    4: RomGod.Venus,
    5: RomGod.Mercury,
    6: RomGod.Luna,
    7: RomGod.Helios,
    8: RomGod.Mercury,
    9: RomGod.Jupiter,
    10: RomGod.Venus,
    11: RomGod.Neptune,
    12: RomGod.Pluto,
    13: RomGod.Jupiter,
    14: RomGod.Saturn,
    15: RomGod.Mars,
    16: RomGod.Uranus,
    17: RomGod.Neptune,
    18: RomGod.Helios,
    19: RomGod.Pluto,
    20: RomGod.Uranus,
    21: RomGod.Saturn,
  };

  //

  static const impactMinor = {
    /// Wands 0-13
    // Ace of Wands
    0: {
      TarotSuit.Wands: 28,
      TarotSuit.Pentacles: 14,
      TarotSuit.Swords: 27,
      TarotSuit.Cups: 34,
    },
    // 2 Wands
    1: {
      TarotSuit.Wands: 29,
      TarotSuit.Pentacles: 15,
      TarotSuit.Swords: 26,
      TarotSuit.Cups: 33,
    },
    // ...
    2: {
      TarotSuit.Wands: 30,
      TarotSuit.Pentacles: 16,
      TarotSuit.Swords: 25,
      TarotSuit.Cups: 32,
    },
    //
    3: {
      TarotSuit.Wands: 31,
      TarotSuit.Pentacles: 17,
      TarotSuit.Swords: 24,
      TarotSuit.Cups: 31,
    },
    //
    4: {
      TarotSuit.Wands: 32,
      TarotSuit.Pentacles: 18,
      TarotSuit.Swords: 23,
      TarotSuit.Cups: 30,
    },
    //
    5: {
      TarotSuit.Wands: 33,
      TarotSuit.Pentacles: 19,
      TarotSuit.Swords: 22,
      TarotSuit.Cups: 29,
    },
    //
    6: {
      TarotSuit.Wands: 34,
      TarotSuit.Pentacles: 20,
      TarotSuit.Swords: 21,
      TarotSuit.Cups: 28,
    },
    //
    7: {
      TarotSuit.Wands: 35,
      TarotSuit.Pentacles: 21,
      TarotSuit.Swords: 20,
      TarotSuit.Cups: 27,
    },
    //
    8: {
      TarotSuit.Wands: 36,
      TarotSuit.Pentacles: 22,
      TarotSuit.Swords: 19,
      TarotSuit.Cups: 26,
    },
    //
    9: {
      TarotSuit.Wands: 37,
      TarotSuit.Pentacles: 23,
      TarotSuit.Swords: 18,
      TarotSuit.Cups: 25,
    },
    //
    10: {
      TarotSuit.Wands: 38,
      TarotSuit.Pentacles: 24,
      TarotSuit.Swords: 17,
      TarotSuit.Cups: 24,
    },
    //
    11: {
      TarotSuit.Wands: 37,
      TarotSuit.Pentacles: 25,
      TarotSuit.Swords: 16,
      TarotSuit.Cups: 23,
    },
    //
    12: {
      TarotSuit.Wands: 36,
      TarotSuit.Pentacles: 26,
      TarotSuit.Swords: 15,
      TarotSuit.Cups: 22,
    },
    // Aries
    13: {
      TarotSuit.Wands: 35,
      TarotSuit.Pentacles: 27,
      TarotSuit.Swords: 14,
      TarotSuit.Cups: 21,
    },
    //
    /// Pentactles 14-27
    // Ace Of Pentacles
    14: {
      TarotSuit.Wands: 34,
      TarotSuit.Pentacles: 28,
      TarotSuit.Swords: 14,
      TarotSuit.Cups: 27,
    },
    //
    15: {
      TarotSuit.Wands: 33,
      TarotSuit.Pentacles: 29,
      TarotSuit.Swords: 15,
      TarotSuit.Cups: 26,
    },
    //
    16: {
      TarotSuit.Wands: 32,
      TarotSuit.Pentacles: 30,
      TarotSuit.Swords: 16,
      TarotSuit.Cups: 25,
    },
    //
    17: {
      TarotSuit.Wands: 31,
      TarotSuit.Pentacles: 31,
      TarotSuit.Swords: 17,
      TarotSuit.Cups: 24,
    },
    //
    18: {
      TarotSuit.Wands: 30,
      TarotSuit.Pentacles: 32,
      TarotSuit.Swords: 18,
      TarotSuit.Cups: 23,
    },
    //
    19: {
      TarotSuit.Wands: 29,
      TarotSuit.Pentacles: 33,
      TarotSuit.Swords: 19,
      TarotSuit.Cups: 22,
    },
    //
    20: {
      TarotSuit.Wands: 28,
      TarotSuit.Pentacles: 34,
      TarotSuit.Swords: 20,
      TarotSuit.Cups: 21,
    },
    //
    21: {
      TarotSuit.Wands: 27,
      TarotSuit.Pentacles: 35,
      TarotSuit.Swords: 21,
      TarotSuit.Cups: 20,
    },
    //
    22: {
      TarotSuit.Wands: 26,
      TarotSuit.Pentacles: 36,
      TarotSuit.Swords: 22,
      TarotSuit.Cups: 19,
    },
    //
    23: {
      TarotSuit.Wands: 25,
      TarotSuit.Pentacles: 37,
      TarotSuit.Swords: 23,
      TarotSuit.Cups: 18,
    },
    //
    24: {
      TarotSuit.Wands: 24,
      TarotSuit.Pentacles: 38,
      TarotSuit.Swords: 24,
      TarotSuit.Cups: 17,
    },
    //
    25: {
      TarotSuit.Wands: 23,
      TarotSuit.Pentacles: 37,
      TarotSuit.Swords: 25,
      TarotSuit.Cups: 16,
    },
    //
    26: {
      TarotSuit.Wands: 22,
      TarotSuit.Pentacles: 36,
      TarotSuit.Swords: 26,
      TarotSuit.Cups: 15,
    },
    // Capricorn
    27: {
      TarotSuit.Wands: 21,
      TarotSuit.Pentacles: 35,
      TarotSuit.Swords: 27,
      TarotSuit.Cups: 14,
    },
    //
    /// Swords 28-41
    // Ace Of Swords
    28: {
      TarotSuit.Wands: 27,
      TarotSuit.Pentacles: 34,
      TarotSuit.Swords: 28,
      TarotSuit.Cups: 14,
    },
    // two of swords
    29: {
      TarotSuit.Wands: 26,
      TarotSuit.Pentacles: 33,
      TarotSuit.Swords: 29,
      TarotSuit.Cups: 15,
    },
    //
    30: {
      TarotSuit.Wands: 25,
      TarotSuit.Pentacles: 32,
      TarotSuit.Swords: 30,
      TarotSuit.Cups: 16,
    },
    //
    31: {
      TarotSuit.Wands: 24,
      TarotSuit.Pentacles: 31,
      TarotSuit.Swords: 31,
      TarotSuit.Cups: 17,
    },
    //
    32: {
      TarotSuit.Wands: 23,
      TarotSuit.Pentacles: 30,
      TarotSuit.Swords: 32,
      TarotSuit.Cups: 18,
    },
    //
    33: {
      TarotSuit.Wands: 22,
      TarotSuit.Pentacles: 29,
      TarotSuit.Swords: 33,
      TarotSuit.Cups: 19,
    },
    //
    34: {
      TarotSuit.Wands: 21,
      TarotSuit.Pentacles: 28,
      TarotSuit.Swords: 34,
      TarotSuit.Cups: 20,
    },
    //
    35: {
      TarotSuit.Wands: 20,
      TarotSuit.Pentacles: 27,
      TarotSuit.Swords: 35,
      TarotSuit.Cups: 21,
    },
    //
    36: {
      TarotSuit.Wands: 19,
      TarotSuit.Pentacles: 26,
      TarotSuit.Swords: 36,
      TarotSuit.Cups: 22,
    },
    //
    37: {
      TarotSuit.Wands: 18,
      TarotSuit.Pentacles: 25,
      TarotSuit.Swords: 37,
      TarotSuit.Cups: 23,
    },
    //
    38: {
      TarotSuit.Wands: 17,
      TarotSuit.Pentacles: 24,
      TarotSuit.Swords: 38,
      TarotSuit.Cups: 24,
    },
    //
    39: {
      TarotSuit.Wands: 16,
      TarotSuit.Pentacles: 23,
      TarotSuit.Swords: 37,
      TarotSuit.Cups: 25,
    },
    //
    40: {
      TarotSuit.Wands: 15,
      TarotSuit.Pentacles: 22,
      TarotSuit.Swords: 36,
      TarotSuit.Cups: 26,
    },
    // Libra
    41: {
      TarotSuit.Wands: 14,
      TarotSuit.Pentacles: 21,
      TarotSuit.Swords: 35,
      TarotSuit.Cups: 27,
    },
    //
    /// Cups 42-55
    // Ace Of Cups
    42: {
      TarotSuit.Wands: 14,
      TarotSuit.Pentacles: 27,
      TarotSuit.Swords: 34,
      TarotSuit.Cups: 28,
    },
    //
    43: {
      TarotSuit.Wands: 15,
      TarotSuit.Pentacles: 26,
      TarotSuit.Swords: 33,
      TarotSuit.Cups: 29,
    },
    //
    44: {
      TarotSuit.Wands: 16,
      TarotSuit.Pentacles: 25,
      TarotSuit.Swords: 32,
      TarotSuit.Cups: 30,
    },
    //
    45: {
      TarotSuit.Wands: 17,
      TarotSuit.Pentacles: 24,
      TarotSuit.Swords: 31,
      TarotSuit.Cups: 31,
    },
    //
    46: {
      TarotSuit.Wands: 18,
      TarotSuit.Pentacles: 23,
      TarotSuit.Swords: 30,
      TarotSuit.Cups: 32,
    },
    //
    47: {
      TarotSuit.Wands: 19,
      TarotSuit.Pentacles: 22,
      TarotSuit.Swords: 29,
      TarotSuit.Cups: 33,
    },
    //
    48: {
      TarotSuit.Wands: 20,
      TarotSuit.Pentacles: 21,
      TarotSuit.Swords: 28,
      TarotSuit.Cups: 34,
    },
    //
    49: {
      TarotSuit.Wands: 21,
      TarotSuit.Pentacles: 20,
      TarotSuit.Swords: 27,
      TarotSuit.Cups: 35,
    },
    //
    50: {
      TarotSuit.Wands: 22,
      TarotSuit.Pentacles: 19,
      TarotSuit.Swords: 26,
      TarotSuit.Cups: 36,
    },
    //
    51: {
      TarotSuit.Wands: 23,
      TarotSuit.Pentacles: 18,
      TarotSuit.Swords: 25,
      TarotSuit.Cups: 37,
    },
    //
    52: {
      TarotSuit.Wands: 24,
      TarotSuit.Pentacles: 17,
      TarotSuit.Swords: 24,
      TarotSuit.Cups: 38,
    },
    //
    53: {
      TarotSuit.Wands: 25,
      TarotSuit.Pentacles: 16,
      TarotSuit.Swords: 23,
      TarotSuit.Cups: 37,
    },
    //
    54: {
      TarotSuit.Wands: 26,
      TarotSuit.Pentacles: 15,
      TarotSuit.Swords: 22,
      TarotSuit.Cups: 36,
    },
    // Cancer
    55: {
      TarotSuit.Wands: 27,
      TarotSuit.Pentacles: 14,
      TarotSuit.Swords: 21,
      TarotSuit.Cups: 35,
    },
    //
  };

  static const impactMajor = {
    0: ProphecyType.LUCK,
    1: ProphecyType.MOODLET,
    2: ProphecyType.INTERNAL_STRENGTH,
    3: ProphecyType.AMBITION,
    4: ProphecyType.INTUITION,
    5: ProphecyType.INTERNAL_STRENGTH,
    6: ProphecyType.LUCK,
    7: ProphecyType.AMBITION,
    8: ProphecyType.INTUITION,
    9: ProphecyType.LUCK,
    10: ProphecyType.MOODLET,
    11: ProphecyType.INTUITION,
    12: ProphecyType.MOODLET,
    13: ProphecyType.AMBITION,
    14: ProphecyType.LUCK,
    15: ProphecyType.AMBITION,
    16: ProphecyType.LUCK,
    17: ProphecyType.MOODLET,
    18: ProphecyType.AMBITION,
    19: ProphecyType.INTUITION,
    20: ProphecyType.LUCK,
    21: ProphecyType.INTERNAL_STRENGTH
  };
}
