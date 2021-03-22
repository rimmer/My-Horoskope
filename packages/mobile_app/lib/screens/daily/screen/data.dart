part of 'screen.dart';

class DailyStateData {
  UserEntity user;
  String labelStr;
  Row birthRow;
  String sign;
  Map<bool, String> currentPlanets = {};
  // animation
  AnimationController animationSheetsFadeOutController;
  Animation<double> animationSheetsFadeOut;
}
