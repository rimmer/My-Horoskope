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
/// if full: +35
/// if major: +21
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

  static const patronFull = {};

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

  static const ordinaryImpactMinor = {};

  static const ordinaryImpactFull = {};

  static const ordinaryImpactMajor = {};
}
