library int_datetime;

extension datetime on int {
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}

int get dtNow => DateTime.now().millisecondsSinceEpoch;

int get dtDay {
  final now = DateTime.now();

  return DateTime.utc(now.year, now.month, now.day).millisecondsSinceEpoch;
}

int get dtMonth {
  final now = DateTime.now();

  return DateTime.utc(now.year, now.month).millisecondsSinceEpoch;
}

int get dtYear {
  final now = DateTime.now();

  return DateTime.utc(now.year).millisecondsSinceEpoch;
}
