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
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    // 2 Wands
    1: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    // ...
    2: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    3: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    4: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    5: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    6: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    7: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    8: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    9: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    10: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    11: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    12: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    // Aries
    13: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    /// Pentactles 14-27
    // Ace Of Pentacles
    14: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    15: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    16: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    17: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    18: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    19: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    20: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    21: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    22: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    23: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    24: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    25: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    26: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    // Capricorn
    27: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    /// Swords 28-41
    // Ace Of Swords
    28: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    // two of swords
    29: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    30: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    31: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    32: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    33: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    34: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    35: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    36: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    37: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    38: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    39: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    40: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    // Libra
    41: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    /// Cups 42-55
    // Ace Of Cups
    42: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    43: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    44: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    45: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    46: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    47: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    48: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    49: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    50: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    51: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    52: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    53: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
    54: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    // Cancer
    55: {
      TarotSuit.Wands: 0,
      TarotSuit.Pentacles: 0,
      TarotSuit.Swords: 0,
      TarotSuit.Cups: 0,
    },
    //
  };

  static const impactMajor = {};
}
