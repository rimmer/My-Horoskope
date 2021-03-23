part of '../screen.dart';

extension DailyScreenAniamtionMethods on _DailyScreenState {
  initAnimations() {
    dat.animationSheetsFadeOutController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    dat.animationSheetsFadeOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: dat.animationSheetsFadeOutController,
      curve: Curves.easeInOut,
    ));

    //
    dat.animationProphecyInternalStrController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 450,
        ));

    dat.animationProphecyMoodController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 500,
        ));

    dat.animationProphecyAmbitionController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 550,
        ));

    dat.animationProphecyIntuitionController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 600,
        ));

    dat.animationProphecyLuckController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 650,
        ));

    dat.animationProphecyInternalStr = Tween<Offset>(
      begin: Offset(-1.5, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: dat.animationProphecyInternalStrController,
        curve: Curves.bounceIn,
      ),
    );

    //
    dat.animationProphecyMood = Tween<Offset>(
      begin: Offset(1.5, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: dat.animationProphecyMoodController,
        curve: Curves.bounceIn,
      ),
    );
    dat.animationProphecyAmbition = Tween<Offset>(
      begin: Offset(-1.5, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: dat.animationProphecyAmbitionController,
        curve: Curves.bounceIn,
      ),
    );
    dat.animationProphecyIntuition = Tween<Offset>(
      begin: Offset(1.5, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: dat.animationProphecyIntuitionController,
        curve: Curves.bounceIn,
      ),
    );
    dat.animationProphecyLuck = Tween<Offset>(
      begin: Offset(-1.5, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: dat.animationProphecyLuckController,
        curve: Curves.bounceIn,
      ),
    );

    //
  }

  disposeAnimations() {
    dat.animationSheetsFadeOutController.dispose();
    dat.animationProphecyInternalStrController.dispose();
    dat.animationProphecyMoodController.dispose();
    dat.animationProphecyAmbitionController.dispose();
    dat.animationProphecyIntuitionController.dispose();
    dat.animationProphecyLuckController.dispose();
  }

  animationNewStateRoutine() {
    dat.animationProphecyInternalStrController.forward();
    dat.animationProphecyMoodController.forward();
    dat.animationProphecyAmbitionController.forward();
    dat.animationProphecyIntuitionController.forward();
    dat.animationProphecyLuckController.forward();
  }

  animationFirstStart() {
    dat.animationSheetsFadeOutController.animateTo(
      dat.animationSheetsFadeOutController.upperBound,
      duration: Duration(seconds: 8),
      curve: Curves.ease,
    );

    dat.animationProphecyInternalStrController.animateTo(
      dat.animationProphecyInternalStrController.upperBound,
      duration: Duration(milliseconds: 0),
      curve: Curves.ease,
    );

    dat.animationProphecyMoodController.animateTo(
      dat.animationProphecyMoodController.upperBound,
      duration: Duration(milliseconds: 0),
      curve: Curves.ease,
    );

    dat.animationProphecyAmbitionController.animateTo(
      dat.animationProphecyAmbitionController.upperBound,
      duration: Duration(milliseconds: 0),
      curve: Curves.ease,
    );

    dat.animationProphecyIntuitionController.animateTo(
      dat.animationProphecyIntuitionController.upperBound,
      duration: Duration(milliseconds: 0),
      curve: Curves.ease,
    );

    dat.animationProphecyLuckController.animateTo(
      dat.animationProphecyLuckController.upperBound,
      duration: Duration(milliseconds: 0),
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
          dat.animationProphecyInternalStrController.reset();
          dat.animationProphecyMoodController.reset();
          dat.animationProphecyAmbitionController.reset();
          dat.animationProphecyIntuitionController.reset();
          dat.animationProphecyLuckController.reset();
          widget.currentIndex.wrapped = index;
          dat.showCalendarSelection = true;
          dat.animationSheetsFadeOutController.forward();
        });
      });
    });
  }
}
