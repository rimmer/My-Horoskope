import 'package:int_datetime/int_datetime.dart';
import 'package:prophecy_model/prophecy_model.dart';

extension BasicAstrology on int {
  /// 21.01 .. 20.02 Aquarius
  /// 21.02 .. 20.03 Pisces
  /// 21.03 .. 20.04 Aries
  /// 21.04 .. 20.05 Taurus
  /// 21.05 .. 21.06 Gemini
  /// 22.06 .. 22.07 Cancer
  /// 23.07 .. 23.08 Leo
  /// 24.08 .. 23.09 Virgo
  /// 24.09 .. 23.10 Libra
  /// 24.10 .. 22.11 Scorpio
  /// 23.11 .. 21.12 Sagittarius
  /// 22.12 .. 20.01 Capricorn
  String get astroSign {
    switch (this.toDateTime.month) {
      case 1:
        if (this.toDateTime.day > 20) return "Aquarius";
        return "Capricorn";
      case 2:
        if (this.toDateTime.day > 20) return "Pisces";
        return "Aquarius";
      case 3:
        if (this.toDateTime.day > 20) return "Aries";
        return "Pisces";
      case 4:
        if (this.toDateTime.day > 20) return "Taurus";
        return "Aries";
      case 5:
        if (this.toDateTime.day > 20) return "Gemini";
        return "Taurus";
      case 6:
        if (this.toDateTime.day > 21) return "Cancer";
        return "Gemini";
      case 7:
        if (this.toDateTime.day > 22) return "Leo";
        return "Cancer";
      case 8:
        if (this.toDateTime.day > 23) return "Virgo";
        return "Leo";
      case 9:
        if (this.toDateTime.day > 23) return "Libra";
        return "Virgo";
      case 10:
        if (this.toDateTime.day > 23) return "Scorpio";
        return "Libra";
      case 11:
        if (this.toDateTime.day > 22) return "Sagittarius";
        return "Scorpio";
      case 12:
        if (this.toDateTime.day > 21) return "Capricorn";
        return "Sagittarius";
    }

    /// "must return something" warning solution
    return "Aries";
  }

  String get astroHousePlanet {
    switch (this.astroSign) {
      case "Aries":
        return "Mars";
      case "Taurus":
        return "Venus";
      case "Gemini":
        return "Mercury";
      case "Cancer":
        return "Moon";
      case "Leo":
        return "Sun";
      case "Virgo":
        return "Mercury";
      case "Libra":
        return "Venus";
      case "Scorpio":
        return "Pluto";
      case "Sagittarius":
        return "Jupiter";
      case "Capricorn":
        return "Saturn";
      case "Aquarius":
        return "Uranus";
      case "Pisces":
        return "Neptune";
    }

    /// "must return something" warning solution
    return "Mars";
  }

  String get dayPatron {
    String patron = "Uranus";

    switch (this.toDateTime.weekday) {
      case 1:
        patron = "Sun";
        break;
      case 2:
        patron = "Moon";
        break;
      case 3:
        patron = "Mars";
        break;
      case 4:
        patron = "Mercury";
        break;
      case 5:
        patron = "Jupiter";
        break;
      case 6:
        patron = "Venus";
        break;
      case 7:
        patron = "Saturn";
        break;
    }

    return patron;
  }
}

extension Karmic on String {
  /// Internal Str - Venus
  /// Moodlet - Mars
  /// Ambition - Sun
  /// Intelligence - Jupiter
  /// Luck - Mercury
  ///
  /// 7/13 middle
  /// x/13
  Map<ProphecyType, List<int>> get choiseConsequenceBySign {
    switch (this) {
      //
      //
      case "Aries":
        return {
          ProphecyType.INTERNAL_STRENGTH: [11, 5, 6, 4, 5, 10],
          ProphecyType.INTELLIGENCE: [9, 8, 6, 5, 4, 7],
          ProphecyType.MOODLET: [2, 3, 4, 7, 9, 10],

          /// unique for aries, rage of mars
          ProphecyType.AMBITION: [13, 12, 11, 10, 9, 8],
          ProphecyType.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Taurus":
        return {
          ProphecyType.INTERNAL_STRENGTH: [10, 4, 7, 5, 6, 11],

          /// unique for taurus, venus catch up
          ProphecyType.INTELLIGENCE: [6, 6, 9, 12, 12, 13],
          ProphecyType.MOODLET: [5, 6, 6, 8, 8, 11],
          ProphecyType.AMBITION: [8, 6, 7, 6, 5, 7],
          ProphecyType.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Gemini":
        return {
          ProphecyType.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],

          /// unique for gemini. unstable genius
          ProphecyType.INTELLIGENCE: [13, 1, 13, 13, 1, 13],
          ProphecyType.MOODLET: [11, 9, 7, 7, 8, 5],
          ProphecyType.AMBITION: [11, 3, 8, 1, 13, 8],
          ProphecyType.LUCK: [9, 6, 8, 9, 10, 6],
        };
      case "Cancer":
        return {
          ProphecyType.INTERNAL_STRENGTH: [11, 5, 6, 4, 5, 10],
          ProphecyType.INTELLIGENCE: [9, 8, 6, 5, 4, 7],

          /// unique for cancer, the moon protection
          ProphecyType.MOODLET: [9, 9, 9, 9, 9, 9],
          ProphecyType.AMBITION: [13, 8, 7, 13, 6, 5],
          ProphecyType.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Leo":
        return {
          ProphecyType.INTERNAL_STRENGTH: [10, 4, 7, 5, 6, 11],
          ProphecyType.INTELLIGENCE: [6, 6, 7, 9, 11, 6],
          ProphecyType.MOODLET: [5, 6, 6, 8, 8, 11],

          /// unique for lion, sunking of the wild
          ProphecyType.AMBITION: [11, 8, 11, 8, 11, 8],
          ProphecyType.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Virgo":
        return {
          ProphecyType.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],
          ProphecyType.INTELLIGENCE: [4, 5, 6, 8, 7, 13],
          ProphecyType.MOODLET: [11, 9, 7, 7, 8, 5],
          ProphecyType.AMBITION: [11, 3, 8, 1, 13, 8],

          /// unique for virgo, gold of mercury
          ProphecyType.LUCK: [9, 6, 9, 9, 9, 13],
        };
      case "Libra":
        return {
          /// unique for libra, the venus charm
          ProphecyType.INTERNAL_STRENGTH: [8, 11, 8, 11, 8, 11],
          ProphecyType.INTELLIGENCE: [9, 8, 6, 5, 4, 7],
          ProphecyType.MOODLET: [2, 3, 4, 7, 9, 10],
          ProphecyType.AMBITION: [13, 8, 7, 13, 6, 5],
          ProphecyType.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Scorpio":
        return {
          ProphecyType.INTERNAL_STRENGTH: [10, 4, 7, 5, 6, 11],
          ProphecyType.INTELLIGENCE: [6, 6, 7, 9, 11, 6],
          ProphecyType.MOODLET: [5, 6, 6, 8, 8, 11],

          /// unique for scorpio, power of underworld
          ProphecyType.AMBITION: [9, 9, 9, 9, 9, 9],
          ProphecyType.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Sagittarius":
        return {
          ProphecyType.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],
          ProphecyType.INTELLIGENCE: [4, 5, 6, 8, 7, 13],
          ProphecyType.MOODLET: [11, 9, 7, 7, 8, 5],

          /// unique for sagittarius, the jupiter bard
          ProphecyType.AMBITION: [11, 8, 8, 11, 11, 8],
          ProphecyType.LUCK: [9, 6, 8, 9, 10, 6],
        };
      case "Capricorn":
        return {
          ProphecyType.INTERNAL_STRENGTH: [11, 5, 6, 4, 5, 10],

          /// unique for capricorn, father saturn
          ProphecyType.INTELLIGENCE: [9, 9, 9, 9, 9, 9],
          ProphecyType.MOODLET: [2, 3, 4, 7, 9, 10],
          ProphecyType.AMBITION: [13, 8, 7, 13, 6, 5],
          ProphecyType.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Aquarius":
        return {
          /// unique for aquarius, between sky and ocean
          ProphecyType.INTERNAL_STRENGTH: [11, 8, 8, 11, 11, 8],
          ProphecyType.INTELLIGENCE: [6, 6, 7, 9, 11, 6],
          ProphecyType.MOODLET: [5, 6, 6, 8, 8, 11],
          ProphecyType.AMBITION: [8, 6, 7, 6, 5, 7],
          ProphecyType.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Pisces":
        return {
          ProphecyType.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],
          ProphecyType.INTELLIGENCE: [4, 5, 6, 8, 7, 13],
          ProphecyType.MOODLET: [11, 9, 7, 7, 8, 5],
          ProphecyType.AMBITION: [11, 3, 8, 1, 13, 8],

          /// unique for pisces, unstable warrior
          ProphecyType.LUCK: [13, 1, 13, 1, 13, 13],
        };
    }
    return null;
  }
}
