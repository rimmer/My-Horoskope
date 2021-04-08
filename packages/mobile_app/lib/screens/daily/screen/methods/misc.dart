part of '../screen.dart';

extension DailyScreenMiscMethods on _DailyScreenState {
  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;
  EnabledProphecies get toShow => sp.appPref.enabledProphecies;
  bool get isToday => d[selected].millisecondsSinceEpoch == dtDay;

  void calculateProphecy() {
    sp.prophecyBloc.add(CalculateProphecy(d[selected].millisecondsSinceEpoch,
        isDebug: sp.debug.isDebug));
  }
}
