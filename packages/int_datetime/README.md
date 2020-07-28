## INT_DATE Temp Module 

Allow to operate with dt through int (miliseconds / seconds) since UNIX approach.
It is a crosslangual standart to deal with date/time and its seriazliation.

In this project it is also neeeded to save correct dates inside data and use dt as a map key.

For example, fucntion (getter) `dtDay`:
```
int get dtDay {
  final now = DateTime.now();

  return DateTime.utc(
      now.year, now.month, now.day
    ).millisecondsSinceEpoch;
}
```
Will return time of the start of current day in milliseconds since approach.
This will save poles correctly. 
And we can use it to check if this day poll already in database.

Also, method `toDateTime`:
```
extension datetime on int {
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}
```
Is usefull for algorithm, allow reverse any integer to DateTime object.