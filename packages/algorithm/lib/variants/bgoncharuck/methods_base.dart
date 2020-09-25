/// in: 26, out: 8
///
/// in: 14, out: 5
///
/// 2+6 = 8
///
/// 1+4= 5
///
/// in: 29, out: 2
///
/// 2+9=11, 11>9, 1+1= 2
int numerologicUnion(int number) {
  /// list of digits in number
  List<int> digits =
      (number.toString().split('')).map((e) => int.parse(e)).toList();

  int union = 0;
  digits.forEach((digit) {
    union += digit;
  });

  /// recursion, if number has 2 or more digits left (10, 11..)
  if (union <= 9)
    return union;
  else
    return numerologicUnion(union);
}

int dayOfWeekDiff(DateTime birthDate, DateTime cur, {int addition = 0}) {
  int dif = (cur.difference(birthDate)).inDays;
  dif += addition;

  return dif % 7;
}

int difMod(DateTime birthDate, DateTime cur, int mod) {
  int dif = (cur.difference(birthDate)).inDays;
  return dif % mod;
}
