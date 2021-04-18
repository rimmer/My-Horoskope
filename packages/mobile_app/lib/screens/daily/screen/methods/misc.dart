part of '../screen.dart';

extension DailyScreenMiscMethods on _DailyScreenState {
  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;
  EnabledProphecies get toShow => StaticProvider.data.appPref.enabledProphecies;
  bool get isToday => d[selected].millisecondsSinceEpoch == dtDay;

  void calculateProphecy() {
    StaticProvider.prophecyBloc.add(CalculateProphecy(
        d[selected].millisecondsSinceEpoch,
        isDebug: StaticProvider.debug.isDebug));
  }

  Future<bool> internetCheck() async {
    try {
      final result = await InternetAddress.lookup('pub.dev');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (_) {}
    return false;
  }
}
