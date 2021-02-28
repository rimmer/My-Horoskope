part of '../screen.dart';

extension DailyScreenMiscMethods on _DailyScreenState {
  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;
  EnabledProphecies get toShow => sp.show.enabledProphecies;
  bool get isToday => d[selected].millisecondsSinceEpoch == dtDay;

  void calculateProphecy() {
    sp.prophecyBloc.add(CalculateProphecy(d[selected].millisecondsSinceEpoch));
  }

  void startUserPollBloc() {
    sp.userPollBloc.loaded = false;
    sp.userPollBloc.add(UserPollRestartEvent());
  }
}
