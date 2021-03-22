part of 'screen.dart';

class DailyStateData {
  UserEntity user;
  String labelStr;
  Row birthRow;
  String sign;
  Map<bool, String> currentPlanets = {};
  // animation
  bool showCalendarSelection = true;
  AnimationController animationSheetsFadeOutController;
  Animation<double> animationSheetsFadeOut;
  AnimationController animationProphecyInternalStrController;
  AnimationController animationProphecyMoodController;
  AnimationController animationProphecyAmbitionController;
  AnimationController animationProphecyIntuitionController;
  AnimationController animationProphecyLuckController;
  AnimationController animationCardsHolderController;
  Animation<Offset> animationProphecyInternalStr;
  Animation<Offset> animationProphecyMood;
  Animation<Offset> animationProphecyAmbition;
  Animation<Offset> animationProphecyIntuition;
  Animation<Offset> animationProphecyLuck;
  Animation<double> animationCardsHolder;
}
