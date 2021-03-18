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
