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
  Widget currentCard;
  AnimationController animationCardFadeController;
  Animation<double> animationCardFade;
  bool treeChoise = false;
  bool coinChoise = false;
  bool starChoise = false;
  bool swordChoise = false;
  bool cupChoise = false;
  bool treeWasChossen = false;
  bool coinWasChossen = false;
  bool starWasChossen = false;
  bool swordWasChossen = false;
  bool cupWasChossen = false;
}
