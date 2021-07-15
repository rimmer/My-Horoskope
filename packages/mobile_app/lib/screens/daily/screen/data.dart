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
  PreparedSymbolCombination combination;
  Animation<double> animationSheetsFadeOut;
  AnimationController animationCardFadeController;
  Animation<double> animationCardFade;
}
