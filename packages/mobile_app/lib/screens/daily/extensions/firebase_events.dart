part of '../daily_screen.dart';

extension DailyScreenFirebaseEvents on _DailyScreenState {
  logEventNoInternetForAds() {
    AppGlobal.firebase.analytics.logEvent(name: "no_internet_for_ads");
  }
}
