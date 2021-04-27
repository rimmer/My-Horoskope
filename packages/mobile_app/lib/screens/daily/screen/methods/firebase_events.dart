part of '../screen.dart';

extension DailyScreenFirebaseEvents on _DailyScreenState {
  logEventNoInternetForAds() {
    StaticProvider.firebase.analytics.logEvent(name: "no_internet_for_ads");
  }
}
