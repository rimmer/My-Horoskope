part of '../screen.dart';

extension DailyScreenAniamtionMethods on _DailyScreenState {
  initAnimations() {
    dat.animationSheetsFadeOutController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    dat.animationSheetsFadeOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: dat.animationSheetsFadeOutController,
      curve: Curves.ease,
    ));

    //
  }

  disposeAnimations() {
    dat.animationSheetsFadeOutController.dispose();
  }

  animationFirstStart() {
    dat.animationSheetsFadeOutController.animateTo(
      dat.animationSheetsFadeOutController.upperBound,
      duration: Duration(seconds: 8),
      curve: Curves.ease,
    );
  }

  calendarTap(int index) {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.showCalendarSelection = false;
      dat.animationSheetsFadeOutController.reverse().whenCompleteOrCancel(() {
        // ignore: invalid_use_of_protected_member
        setState(() {
          widget.currentIndex.wrapped = index;
          dat.showCalendarSelection = true;
          dat.animationSheetsFadeOutController.forward();
        });
      });
    });
  }
}
