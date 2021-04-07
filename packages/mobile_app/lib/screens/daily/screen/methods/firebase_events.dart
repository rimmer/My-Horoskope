part of '../screen.dart';

extension DailyScreenFirebaseEvents on _DailyScreenState {
  /// user name and
  /// birthdate that used in algorithm
  Map<String, dynamic> defaultUserInfo() => {
        "CHARACTER": "${dat.user.model.name}",
        "VALUE": "Birth: ${birthDate.day}.${birthDate.month}.${birthDate.year}",
      };

  /// send information about what day user looking at
  /// we can use it to calibrate algorithm
  /// or to see the most active users
  logCalendarEvent() {
    sp.firebaseAnalytics.logEvent(
      name: (isToday)
          ? "user_watch_current_day"
          : "user_watch_next_${selected}_day",
      parameters: defaultUserInfo(),
    );
  }
}
