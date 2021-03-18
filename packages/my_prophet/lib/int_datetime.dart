library int_datetime;

/// Allow to operate with dt through int (miliseconds / seconds) since UNIX epoch.
/// It is a crosslangual standart to deal with date/time and its seriazliation.

/// In this project it is also needed to save correct dates inside user polls and user models.

extension datetime on int {
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}

int get dtNow => DateTime.now().millisecondsSinceEpoch;

/// Will return time of the start of current day in milliseconds since epoch.
int get dtDay {
  final now = DateTime.now();

  return DateTime.utc(
    now.year,
    now.month,
    now.day,
  ).millisecondsSinceEpoch;
}

/// Will return time of the start of current month in milliseconds since epoch.
int get dtMonth {
  final now = DateTime.now();

  return DateTime.utc(
    now.year,
    now.month,
  ).millisecondsSinceEpoch;
}

/// Will return time of the start of current year in milliseconds since epoch.
int get dtYear {
  final now = DateTime.now();

  return DateTime.utc(now.year).millisecondsSinceEpoch;
}

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
