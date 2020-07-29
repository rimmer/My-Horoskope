import 'package:int_datetime/int_datetime.dart';

extension BasicAstrology on int {
  // 21.01 .. 20.02 Aquarius
  // 21.02 .. 20.03 Pisces
  // 21.03 .. 20.04 Aries
  // 21.04 .. 20.05 Taurus
  // 21.05 .. 21.06 Gemini
  // 22.06 .. 22.07 Cancer
  // 23.07 .. 23.08 Leo
  // 24.08 .. 23.09 Virgo
  // 24.09 .. 23.10 Libra
  // 24.10 .. 22.11 Scorpio
  // 23.11 .. 21.12 Sagittarius
  // 22.12 .. 20.01 Capricorn
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
    // "must return something" warning solution
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
    // "must return something" warning solution
    return "Mars";
  }
}
