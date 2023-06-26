import 'package:base/int_datetime.dart';
import 'package:flutter/widgets.dart';
import 'package:text/text.dart';

const dayToIndex = {
  "TODAY": 0,
  "TOMORROW": 1,
  "DAY AFTER TOMORROW": 2,
};

class _CalendarLogic {
  _CalendarLogic({@required this.numberOfDays}) {
    //
    final today = DateTime.fromMillisecondsSinceEpoch(dtDay);
    day.add(today);

    for (int d = 1; d <= numberOfDays; d++) {
      day.add(today.add(new Duration(days: d)));
    }

    updateAppBarLabel();
  }
  final int numberOfDays;
  final List<DateTime> day = [];
  int _currentDateIndex = 0;
  String _appBarLabel;
  String get appBarLabel => _appBarLabel;
  String _labelPartCache;

  bool get isToday => day[_currentDateIndex].millisecondsSinceEpoch == dtDay;
  bool get isNotToday => day[_currentDateIndex].millisecondsSinceEpoch != dtDay;

  void updateAppBarLabel() {
    if (dayToIndex["TODAY"] == _currentDateIndex)
      _labelPartCache = localeText.today;
    else if (dayToIndex["TOMORROW"] == _currentDateIndex)
      _labelPartCache = localeText.tomorrow;
    else if (dayToIndex["DAY AFTER TOMORROW"] == _currentDateIndex)
      _labelPartCache = localeText.datomorrow;
    else {
      final currentDay = day[_currentDateIndex];
      _labelPartCache = "${currentDay.day}.${currentDay.month}.${currentDay.year}";
    }

    _appBarLabel = "${localeText.horoscopeFor.capitalize()} $_labelPartCache";
  }

  int get currentDateIndex => _currentDateIndex;

  set currentDateIndex(int toSet) {
    _currentDateIndex = toSet;
    updateAppBarLabel();
  }

  DateTime get currentDay => day[_currentDateIndex];
}

class CalendarLogic extends InheritedWidget {
  CalendarLogic({
    @required int numberOfDays,
    @required Widget child,
  })  : _bound = _CalendarLogic(numberOfDays: numberOfDays),
        super(child: child);

  final _CalendarLogic _bound;

  static _CalendarLogic of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<CalendarLogic>())._bound;

  @override
  bool updateShouldNotify(CalendarLogic old) => false;
}
