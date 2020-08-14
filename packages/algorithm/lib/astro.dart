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
  Map<ProphecyId, List<int>> get choiseConsequenceBySign {
    switch (this) {
      //
      //
      case "Aries":
        return {
          ProphecyId.INTERNAL_STRENGTH: [11, 5, 6, 4, 5, 10],
          ProphecyId.INTELLIGENCE: [9, 8, 6, 5, 4, 7],
          ProphecyId.MOODLET: [2, 3, 4, 7, 9, 10],
          ProphecyId.AMBITION: [13, 8, 7, 13, 6, 5],
          ProphecyId.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Taurus":
        return {
          ProphecyId.INTERNAL_STRENGTH: [10, 4, 7, 5, 6, 11],
          ProphecyId.INTELLIGENCE: [6, 6, 7, 9, 11, 6],
          ProphecyId.MOODLET: [5, 6, 6, 8, 8, 11],
          ProphecyId.AMBITION: [8, 6, 7, 6, 5, 7],
          ProphecyId.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Gemini":
        return {
          ProphecyId.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],
          ProphecyId.INTELLIGENCE: [4, 5, 6, 8, 7, 13],
          ProphecyId.MOODLET: [11, 9, 7, 7, 8, 5],
          ProphecyId.AMBITION: [11, 3, 8, 1, 13, 8],
          ProphecyId.LUCK: [9, 6, 8, 9, 10, 6],
        };
      case "Cancer":
        return {
          ProphecyId.INTERNAL_STRENGTH: [11, 5, 6, 4, 5, 10],
          ProphecyId.INTELLIGENCE: [9, 8, 6, 5, 4, 7],
          ProphecyId.MOODLET: [2, 3, 4, 7, 9, 10],
          ProphecyId.AMBITION: [13, 8, 7, 13, 6, 5],
          ProphecyId.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Leo":
        return {
          ProphecyId.INTERNAL_STRENGTH: [10, 4, 7, 5, 6, 11],
          ProphecyId.INTELLIGENCE: [6, 6, 7, 9, 11, 6],
          ProphecyId.MOODLET: [5, 6, 6, 8, 8, 11],
          ProphecyId.AMBITION: [8, 6, 7, 6, 5, 7],
          ProphecyId.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Virgo":
        return {
          ProphecyId.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],
          ProphecyId.INTELLIGENCE: [4, 5, 6, 8, 7, 13],
          ProphecyId.MOODLET: [11, 9, 7, 7, 8, 5],
          ProphecyId.AMBITION: [11, 3, 8, 1, 13, 8],
          ProphecyId.LUCK: [9, 6, 8, 9, 10, 6],
        };
      case "Libra":
        return {
          ProphecyId.INTERNAL_STRENGTH: [11, 5, 6, 4, 5, 10],
          ProphecyId.INTELLIGENCE: [9, 8, 6, 5, 4, 7],
          ProphecyId.MOODLET: [2, 3, 4, 7, 9, 10],
          ProphecyId.AMBITION: [13, 8, 7, 13, 6, 5],
          ProphecyId.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Scorpio":
        return {
          ProphecyId.INTERNAL_STRENGTH: [10, 4, 7, 5, 6, 11],
          ProphecyId.INTELLIGENCE: [6, 6, 7, 9, 11, 6],
          ProphecyId.MOODLET: [5, 6, 6, 8, 8, 11],
          ProphecyId.AMBITION: [8, 6, 7, 6, 5, 7],
          ProphecyId.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Sagittarius":
        return {
          ProphecyId.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],
          ProphecyId.INTELLIGENCE: [4, 5, 6, 8, 7, 13],
          ProphecyId.MOODLET: [11, 9, 7, 7, 8, 5],
          ProphecyId.AMBITION: [11, 3, 8, 1, 13, 8],
          ProphecyId.LUCK: [9, 6, 8, 9, 10, 6],
        };
      case "Capricorn":
        return {
          ProphecyId.INTERNAL_STRENGTH: [11, 5, 6, 4, 5, 10],
          ProphecyId.INTELLIGENCE: [9, 8, 6, 5, 4, 7],
          ProphecyId.MOODLET: [2, 3, 4, 7, 9, 10],
          ProphecyId.AMBITION: [13, 8, 7, 13, 6, 5],
          ProphecyId.LUCK: [6, 7, 8, 9, 10, 6],
        };
      case "Aquarius":
        return {
          ProphecyId.INTERNAL_STRENGTH: [10, 4, 7, 5, 6, 11],
          ProphecyId.INTELLIGENCE: [6, 6, 7, 9, 11, 6],
          ProphecyId.MOODLET: [5, 6, 6, 8, 8, 11],
          ProphecyId.AMBITION: [8, 6, 7, 6, 5, 7],
          ProphecyId.LUCK: [7, 6, 9, 6, 8, 7],
        };
      case "Pisces":
        return {
          ProphecyId.INTERNAL_STRENGTH: [9, 3, 8, 6, 7, 12],
          ProphecyId.INTELLIGENCE: [4, 5, 6, 8, 7, 13],
          ProphecyId.MOODLET: [11, 9, 7, 7, 8, 5],
          ProphecyId.AMBITION: [11, 3, 8, 1, 13, 8],
          ProphecyId.LUCK: [9, 6, 8, 9, 10, 6],
        };
    }
    return null;
  }
}
