part of '../daily_screen.dart';

class DailyStateData {
  UserEntity get user => AppGlobal.data.usersRepo.current;
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
  bool ambianceAdd = false;
  bool ambianceChange = false;
  UserEntity ambianceChangeSubject;
}
