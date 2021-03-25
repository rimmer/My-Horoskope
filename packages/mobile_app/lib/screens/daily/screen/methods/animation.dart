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

    dat.animationCardFadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    dat.animationCardFade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: dat.animationCardFadeController,
      curve: Curves.ease,
    ));

    //
  }

  disposeAnimations() {
    dat.animationSheetsFadeOutController.dispose();
    dat.animationCardFadeController.dispose();
  }

  animationNewStateRoutine() {}

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
          dat.currentCard = null;
          dat.treeChoise = false;
          dat.coinChoise = false;
          dat.starChoise = false;
          dat.swordChoise = false;
          dat.cupChoise = false;
          widget.currentIndex.wrapped = index;
          dat.showCalendarSelection = true;
          dat.animationSheetsFadeOutController.forward();
        });
      });
    });
  }
}
