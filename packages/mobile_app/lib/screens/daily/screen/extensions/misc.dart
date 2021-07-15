part of '../screen.dart';

extension DailyScreenMiscMethods on _DailyScreenState {
  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;
  EnabledProphecies get toShow => StaticProvider.data.appPref.enabledProphecies;
  bool get isToday => d[selected].millisecondsSinceEpoch == dtDay;

  void calculateProphecy() {
    StaticProvider.prophecyUtil.calculate(
        dt: d[selected].millisecondsSinceEpoch,
        isDebug: StaticProvider.debug.isDebug);
  }

  PreparedSymbolCombination getCombinationCallback() =>
      getSymbolCombination(StaticProvider.prophecyUtil.current);
}
