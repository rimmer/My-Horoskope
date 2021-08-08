part of '../daily_screen.dart';

extension DailyScreenMiscMethods on _DailyScreenState {
  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;
  EnabledProphecies get toShow => AppGlobal.data.appPref.enabledProphecies;
  bool get isToday => d[selected].millisecondsSinceEpoch == dtDay;

  void calculateProphecy() {
    AppGlobal.prophecyUtil.calculate(
        dt: d[selected].millisecondsSinceEpoch,
        isDebug: AppGlobal.debug.isDebug,
        user: dat.user);
  }

  PreparedSymbolCombination getCombinationCallback() =>
      getSymbolCombination(AppGlobal.prophecyUtil.current);
}
