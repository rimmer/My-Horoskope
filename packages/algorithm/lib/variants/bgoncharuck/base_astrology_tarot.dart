part of 'algorithm.dart';

/// use Kabbalah and Calestial Tarot
/// connects it with rome (greek) astrology
/// will give from 21 to 42 points (2.1 - 4.2) to every prophecy
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
/// if minor: +42
/// if full: +40
/// if major: +38
///
/// if no patron matched,
/// ordinaryImpact must be used
///
class _Kabbalah {
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
      TarotSuit.Wands: 18,
      TarotSuit.Pentacles: 4,
      TarotSuit.Swords: 17,
      TarotSuit.Cups: 24,
    },
    // 2 Wands
    1: {
      TarotSuit.Wands: 19,
      TarotSuit.Pentacles: 5,
      TarotSuit.Swords: 16,
      TarotSuit.Cups: 23,
    },
    // ...
    2: {
      TarotSuit.Wands: 20,
      TarotSuit.Pentacles: 6,
      TarotSuit.Swords: 15,
      TarotSuit.Cups: 22,
    },
    //
    3: {
      TarotSuit.Wands: 21,
      TarotSuit.Pentacles: 7,
      TarotSuit.Swords: 14,
      TarotSuit.Cups: 21,
    },
    //
    4: {
      TarotSuit.Wands: 22,
      TarotSuit.Pentacles: 8,
      TarotSuit.Swords: 13,
      TarotSuit.Cups: 20,
    },
    //
    5: {
      TarotSuit.Wands: 23,
      TarotSuit.Pentacles: 9,
      TarotSuit.Swords: 12,
      TarotSuit.Cups: 19,
    },
    //
    6: {
      TarotSuit.Wands: 24,
      TarotSuit.Pentacles: 10,
      TarotSuit.Swords: 11,
      TarotSuit.Cups: 18,
    },
    //
    7: {
      TarotSuit.Wands: 25,
      TarotSuit.Pentacles: 11,
      TarotSuit.Swords: 10,
      TarotSuit.Cups: 17,
    },
    //
    8: {
      TarotSuit.Wands: 26,
      TarotSuit.Pentacles: 12,
      TarotSuit.Swords: 9,
      TarotSuit.Cups: 16,
    },
    //
    9: {
      TarotSuit.Wands: 27,
      TarotSuit.Pentacles: 13,
      TarotSuit.Swords: 8,
      TarotSuit.Cups: 15,
    },
    //
    10: {
      TarotSuit.Wands: 28,
      TarotSuit.Pentacles: 14,
      TarotSuit.Swords: 7,
      TarotSuit.Cups: 14,
    },
    //
    11: {
      TarotSuit.Wands: 27,
      TarotSuit.Pentacles: 15,
      TarotSuit.Swords: 6,
      TarotSuit.Cups: 13,
    },
    //
    12: {
      TarotSuit.Wands: 26,
      TarotSuit.Pentacles: 16,
      TarotSuit.Swords: 5,
      TarotSuit.Cups: 12,
    },
    // Aries
    13: {
      TarotSuit.Wands: 25,
      TarotSuit.Pentacles: 17,
      TarotSuit.Swords: 4,
      TarotSuit.Cups: 11,
    },
    //
    /// Pentactles 14-27
    // Ace Of Pentacles
    14: {
      TarotSuit.Wands: 24,
      TarotSuit.Pentacles: 18,
      TarotSuit.Swords: 4,
      TarotSuit.Cups: 17,
    },
    //
    15: {
      TarotSuit.Wands: 23,
      TarotSuit.Pentacles: 19,
      TarotSuit.Swords: 5,
      TarotSuit.Cups: 16,
    },
    //
    16: {
      TarotSuit.Wands: 22,
      TarotSuit.Pentacles: 20,
      TarotSuit.Swords: 6,
      TarotSuit.Cups: 15,
    },
    //
    17: {
      TarotSuit.Wands: 21,
      TarotSuit.Pentacles: 21,
      TarotSuit.Swords: 7,
      TarotSuit.Cups: 14,
    },
    //
    18: {
      TarotSuit.Wands: 20,
      TarotSuit.Pentacles: 22,
      TarotSuit.Swords: 8,
      TarotSuit.Cups: 13,
    },
    //
    19: {
      TarotSuit.Wands: 19,
      TarotSuit.Pentacles: 23,
      TarotSuit.Swords: 9,
      TarotSuit.Cups: 12,
    },
    //
    20: {
      TarotSuit.Wands: 18,
      TarotSuit.Pentacles: 24,
      TarotSuit.Swords: 10,
      TarotSuit.Cups: 11,
    },
    //
    21: {
      TarotSuit.Wands: 17,
      TarotSuit.Pentacles: 25,
      TarotSuit.Swords: 11,
      TarotSuit.Cups: 10,
    },
    //
    22: {
      TarotSuit.Wands: 16,
      TarotSuit.Pentacles: 26,
      TarotSuit.Swords: 12,
      TarotSuit.Cups: 9,
    },
    //
    23: {
      TarotSuit.Wands: 15,
      TarotSuit.Pentacles: 27,
      TarotSuit.Swords: 13,
      TarotSuit.Cups: 8,
    },
    //
    24: {
      TarotSuit.Wands: 14,
      TarotSuit.Pentacles: 28,
      TarotSuit.Swords: 14,
      TarotSuit.Cups: 7,
    },
    //
    25: {
      TarotSuit.Wands: 13,
      TarotSuit.Pentacles: 27,
      TarotSuit.Swords: 15,
      TarotSuit.Cups: 6,
    },
    //
    26: {
      TarotSuit.Wands: 12,
      TarotSuit.Pentacles: 26,
      TarotSuit.Swords: 16,
      TarotSuit.Cups: 5,
    },
    // Capricorn
    27: {
      TarotSuit.Wands: 11,
      TarotSuit.Pentacles: 25,
      TarotSuit.Swords: 17,
      TarotSuit.Cups: 4,
    },
    //
    /// Swords 28-41
    // Ace Of Swords
    28: {
      TarotSuit.Wands: 17,
      TarotSuit.Pentacles: 24,
      TarotSuit.Swords: 18,
      TarotSuit.Cups: 4,
    },
    // two of swords
    29: {
      TarotSuit.Wands: 16,
      TarotSuit.Pentacles: 23,
      TarotSuit.Swords: 19,
      TarotSuit.Cups: 5,
    },
    //
    30: {
      TarotSuit.Wands: 15,
      TarotSuit.Pentacles: 22,
      TarotSuit.Swords: 20,
      TarotSuit.Cups: 6,
    },
    //
    31: {
      TarotSuit.Wands: 14,
      TarotSuit.Pentacles: 21,
      TarotSuit.Swords: 21,
      TarotSuit.Cups: 7,
    },
    //
    32: {
      TarotSuit.Wands: 13,
      TarotSuit.Pentacles: 20,
      TarotSuit.Swords: 22,
      TarotSuit.Cups: 8,
    },
    //
    33: {
      TarotSuit.Wands: 12,
      TarotSuit.Pentacles: 19,
      TarotSuit.Swords: 23,
      TarotSuit.Cups: 9,
    },
    //
    34: {
      TarotSuit.Wands: 11,
      TarotSuit.Pentacles: 18,
      TarotSuit.Swords: 24,
      TarotSuit.Cups: 10,
    },
    //
    35: {
      TarotSuit.Wands: 10,
      TarotSuit.Pentacles: 17,
      TarotSuit.Swords: 25,
      TarotSuit.Cups: 11,
    },
    //
    36: {
      TarotSuit.Wands: 9,
      TarotSuit.Pentacles: 16,
      TarotSuit.Swords: 26,
      TarotSuit.Cups: 12,
    },
    //
    37: {
      TarotSuit.Wands: 8,
      TarotSuit.Pentacles: 15,
      TarotSuit.Swords: 27,
      TarotSuit.Cups: 13,
    },
    //
    38: {
      TarotSuit.Wands: 7,
      TarotSuit.Pentacles: 14,
      TarotSuit.Swords: 28,
      TarotSuit.Cups: 14,
    },
    //
    39: {
      TarotSuit.Wands: 6,
      TarotSuit.Pentacles: 13,
      TarotSuit.Swords: 27,
      TarotSuit.Cups: 15,
    },
    //
    40: {
      TarotSuit.Wands: 5,
      TarotSuit.Pentacles: 12,
      TarotSuit.Swords: 26,
      TarotSuit.Cups: 16,
    },
    // Libra
    41: {
      TarotSuit.Wands: 4,
      TarotSuit.Pentacles: 11,
      TarotSuit.Swords: 25,
      TarotSuit.Cups: 17,
    },
    //
    /// Cups 42-55
    // Ace Of Cups
    42: {
      TarotSuit.Wands: 4,
      TarotSuit.Pentacles: 17,
      TarotSuit.Swords: 24,
      TarotSuit.Cups: 18,
    },
    //
    43: {
      TarotSuit.Wands: 5,
      TarotSuit.Pentacles: 16,
      TarotSuit.Swords: 23,
      TarotSuit.Cups: 19,
    },
    //
    44: {
      TarotSuit.Wands: 6,
      TarotSuit.Pentacles: 15,
      TarotSuit.Swords: 22,
      TarotSuit.Cups: 20,
    },
    //
    45: {
      TarotSuit.Wands: 7,
      TarotSuit.Pentacles: 14,
      TarotSuit.Swords: 21,
      TarotSuit.Cups: 21,
    },
    //
    46: {
      TarotSuit.Wands: 8,
      TarotSuit.Pentacles: 13,
      TarotSuit.Swords: 20,
      TarotSuit.Cups: 22,
    },
    //
    47: {
      TarotSuit.Wands: 9,
      TarotSuit.Pentacles: 12,
      TarotSuit.Swords: 19,
      TarotSuit.Cups: 23,
    },
    //
    48: {
      TarotSuit.Wands: 10,
      TarotSuit.Pentacles: 11,
      TarotSuit.Swords: 18,
      TarotSuit.Cups: 24,
    },
    //
    49: {
      TarotSuit.Wands: 11,
      TarotSuit.Pentacles: 10,
      TarotSuit.Swords: 17,
      TarotSuit.Cups: 25,
    },
    //
    50: {
      TarotSuit.Wands: 12,
      TarotSuit.Pentacles: 9,
      TarotSuit.Swords: 16,
      TarotSuit.Cups: 26,
    },
    //
    51: {
      TarotSuit.Wands: 13,
      TarotSuit.Pentacles: 8,
      TarotSuit.Swords: 15,
      TarotSuit.Cups: 27,
    },
    //
    52: {
      TarotSuit.Wands: 14,
      TarotSuit.Pentacles: 7,
      TarotSuit.Swords: 14,
      TarotSuit.Cups: 28,
    },
    //
    53: {
      TarotSuit.Wands: 15,
      TarotSuit.Pentacles: 6,
      TarotSuit.Swords: 13,
      TarotSuit.Cups: 27,
    },
    //
    54: {
      TarotSuit.Wands: 16,
      TarotSuit.Pentacles: 5,
      TarotSuit.Swords: 12,
      TarotSuit.Cups: 26,
    },
    // Cancer
    55: {
      TarotSuit.Wands: 17,
      TarotSuit.Pentacles: 4,
      TarotSuit.Swords: 11,
      TarotSuit.Cups: 25,
    },
    //
  };

  static const impactMajor = {};
}
