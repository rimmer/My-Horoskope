import 'package:my_prophet/int_datetime.dart';
import 'package:my_prophet/prophecy/entity/prophecy.dart';

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

  String get astroElement {
    switch (this.astroSign) {
      case "Aries":
        return "Fire";
      case "Taurus":
        return "Earth";
      case "Gemini":
        return "Air";
      case "Cancer":
        return "Water";
      case "Leo":
        return "Fire";
      case "Virgo":
        return "Earth";
      case "Libra":
        return "Air";
      case "Scorpio":
        return "Water";
      case "Sagittarius":
        return "Fire";
      case "Capricorn":
        return "Earth";
      case "Aquarius":
        return "Air";
      case "Pisces":
        return "Water";
    }

    /// "must return something" warning solution
    return "Fire";
  }

  String get astroForm {
    switch (this.astroSign) {
      case "Aries":
        return "Cardinal";
      case "Taurus":
        return "Fixed";
      case "Gemini":
        return "Mutable";
      case "Cancer":
        return "Cardinal";
      case "Leo":
        return "Fixed";
      case "Virgo":
        return "Mutable";
      case "Libra":
        return "Cardinal";
      case "Scorpio":
        return "Fixed";
      case "Sagittarius":
        return "Mutable";
      case "Capricorn":
        return "Cardinal";
      case "Aquarius":
        return "Fixed";
      case "Pisces":
        return "Mutable";
    }

    /// "must return something" warning solution
    return "Fire";
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
  /// INTUITION - Jupiter
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
          ProphecyType.INTERNAL_STRENGTH: [1, 3, 6, 9, 11, 13],
          ProphecyType.INTUITION: [13, 4, 5, 9, 2, 9],
          ProphecyType.MOODLET: [6, 8, 6, 9, 9, 10],
          ProphecyType.AMBITION: [8, 8, 8, 8, 8, 8],
          ProphecyType.LUCK: [8, 4, 7, 13, 6, 9],
        };
      case "Taurus":
        return {
          ProphecyType.INTERNAL_STRENGTH: [1, 3, 6, 9, 11, 13],
          ProphecyType.INTUITION: [6, 8, 6, 9, 9, 10],
          ProphecyType.MOODLET: [8, 8, 8, 8, 8, 8],
          ProphecyType.AMBITION: [8, 4, 7, 13, 6, 9],
          ProphecyType.LUCK: [13, 4, 5, 9, 2, 9],
        };
      case "Gemini":
        return {
          ProphecyType.INTERNAL_STRENGTH: [1, 3, 6, 9, 11, 13],
          ProphecyType.INTUITION: [8, 8, 8, 8, 8, 8],
          ProphecyType.MOODLET: [8, 4, 7, 13, 6, 9],
          ProphecyType.AMBITION: [13, 4, 5, 9, 2, 9],
          ProphecyType.LUCK: [6, 8, 6, 9, 9, 10],
        };
      case "Cancer":
        return {
          ProphecyType.INTERNAL_STRENGTH: [13, 4, 5, 9, 2, 9],
          ProphecyType.INTUITION: [8, 8, 8, 8, 8, 8],
          ProphecyType.MOODLET: [8, 4, 7, 13, 6, 9],
          ProphecyType.AMBITION: [1, 3, 6, 9, 11, 13],
          ProphecyType.LUCK: [6, 8, 6, 9, 9, 10],
        };
      case "Leo":
        return {
          ProphecyType.INTERNAL_STRENGTH: [1, 3, 6, 9, 11, 13],
          ProphecyType.INTUITION: [13, 4, 5, 9, 2, 9],
          ProphecyType.MOODLET: [8, 8, 8, 8, 8, 8],
          ProphecyType.AMBITION: [8, 4, 7, 13, 6, 9],
          ProphecyType.LUCK: [6, 8, 6, 9, 9, 10],
        };
      case "Virgo":
        return {
          ProphecyType.INTERNAL_STRENGTH: [8, 8, 8, 8, 8, 8],
          ProphecyType.INTUITION: [8, 4, 7, 13, 6, 9],
          ProphecyType.MOODLET: [6, 8, 6, 9, 9, 10],
          ProphecyType.AMBITION: [1, 3, 6, 9, 11, 13],
          ProphecyType.LUCK: [13, 4, 5, 9, 2, 9],
        };
      case "Libra":
        return {
          ProphecyType.INTERNAL_STRENGTH: [6, 8, 6, 9, 9, 10],
          ProphecyType.INTUITION: [1, 3, 6, 9, 11, 13],
          ProphecyType.MOODLET: [8, 8, 8, 8, 8, 8],
          ProphecyType.AMBITION: [13, 4, 5, 9, 2, 9],
          ProphecyType.LUCK: [8, 4, 7, 13, 6, 9],
        };
      case "Scorpio":
        return {
          ProphecyType.INTERNAL_STRENGTH: [13, 4, 5, 9, 2, 9],
          ProphecyType.INTUITION: [8, 8, 8, 8, 8, 8],
          ProphecyType.MOODLET: [8, 4, 7, 13, 6, 9],
          ProphecyType.AMBITION: [6, 8, 6, 9, 9, 10],
          ProphecyType.LUCK: [1, 3, 6, 9, 11, 13],
        };
      case "Sagittarius":
        return {
          ProphecyType.INTERNAL_STRENGTH: [8, 8, 8, 8, 8, 8],
          ProphecyType.INTUITION: [1, 3, 6, 9, 11, 13],
          ProphecyType.MOODLET: [6, 8, 6, 9, 9, 10],
          ProphecyType.AMBITION: [13, 4, 5, 9, 2, 9],
          ProphecyType.LUCK: [8, 4, 7, 13, 6, 9],
        };
      case "Capricorn":
        return {
          ProphecyType.INTERNAL_STRENGTH: [6, 8, 6, 9, 9, 10],
          ProphecyType.INTUITION: [1, 3, 6, 9, 11, 13],
          ProphecyType.MOODLET: [8, 4, 7, 13, 6, 9],
          ProphecyType.AMBITION: [8, 8, 8, 8, 8, 8],
          ProphecyType.LUCK: [13, 4, 5, 9, 2, 9],
        };
      case "Aquarius":
        return {
          ProphecyType.INTERNAL_STRENGTH: [13, 4, 5, 9, 2, 9],
          ProphecyType.INTUITION: [6, 8, 6, 9, 9, 10],
          ProphecyType.MOODLET: [8, 4, 7, 13, 6, 9],
          ProphecyType.AMBITION: [1, 3, 6, 9, 11, 13],
          ProphecyType.LUCK: [8, 8, 8, 8, 8, 8],
        };
      case "Pisces":
        return {
          ProphecyType.INTERNAL_STRENGTH: [1, 3, 6, 9, 11, 13],
          ProphecyType.INTUITION: [8, 8, 8, 8, 8, 8],
          ProphecyType.MOODLET: [8, 4, 7, 13, 6, 9],
          ProphecyType.AMBITION: [13, 4, 5, 9, 2, 9],
          ProphecyType.LUCK: [6, 8, 6, 9, 9, 10],
        };
    }
    return null;
  }
}
