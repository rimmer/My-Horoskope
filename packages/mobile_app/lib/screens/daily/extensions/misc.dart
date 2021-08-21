part of '../daily_screen.dart';

extension DailyScreenMiscMethods on _DailyScreenState {
  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;
  EnabledProphecies get toShow => AppGlobal.data.appPref.enabledProphecies;
  bool get isToday => d[selected].millisecondsSinceEpoch == dtDay;

  unfocusAmbiancePopup() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.ambianceAdd = false;
      dat.ambianceChange = false;
    });
  }

  focusAmbianceAdd() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.ambianceAdd = true;
    });
  }

  focusAmbianceChange() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.ambianceChange = true;
    });
  }

  void calculateProphecy() {
    AppGlobal.prophecyUtil.calculate(
        dt: d[selected].millisecondsSinceEpoch,
        isDebug: AppGlobal.debug.isDebug,
        user: dat.user);
  }

  double getCompatibility(UserEntity subject) {
    return AppGlobal.prophecyUtil.compatibility(
      dt: d[selected].millisecondsSinceEpoch,
      user: dat.user,
      subject: subject,
    );
  }

  PreparedSymbolCombination getCombinationCallback() =>
      getSymbolCombination(AppGlobal.prophecyUtil.current);
}
