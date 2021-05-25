import 'dart:io';

import 'package:base/preferences/interface.dart';
import 'package:base/prophecy/bloc/bloc.dart';
import 'package:base/user/auth/bloc/bloc.dart';
import 'package:base/user/repository/interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'local_notifications.dart';
import 'predictions.dart';

export 'package:base/preferences/interface.dart';
export 'package:base/prophecy/bloc/bloc.dart';
export 'package:base/user/auth/bloc/bloc.dart';
export 'package:base/user/repository/interface.dart';
export 'package:firebase_analytics/firebase_analytics.dart';

export 'predictions.dart';

class _Tester {
  final MutableBool testerField = MutableBool(!kReleaseMode);

  //
  bool get isDebug => testerField.wrapped;
  bool get isNotDebug => !testerField.wrapped;
}

class StaticProvider {
  /// data
  static _SPData data = _SPData();

  /// blocs
  // ignore: close_sinks
  static AuthenticationBloc authBloc;

  // ignore: close_sinks
  static ProphecyBloc prophecyBloc;

  /// services
  static _Firebase firebase = _Firebase();
  static _Tester debug = _Tester();
  static _LocalNotifications notifications = _LocalNotifications();

  /// ads
  static _Ads ads = _Ads();

  static bool internetAvailable = true;

  /// getters
  static bool get adsAreDisabled => debug.isDebug;
}

class _SPData {
  UsersRepository usersRepo;
  AppPreferences appPref;
  PredictionsFlutterMobile predictions;
}

class _Firebase {
  FirebaseAnalytics analytics;
  NotificationSettings notifications;
  FirebaseMessaging messaging;
}

class _Ads {
  String _adUnitTest = "ca-app-pub-3940256099942544/1033173712";
  String _adUnitProd = "ca-app-pub-4088776870080587/3604438949";
  //
  String get adUnitId =>
      StaticProvider.debug.isDebug ? _adUnitTest : _adUnitProd;

  bool watchAdsButtonIsInactive = false;
  AdWithoutView loadedAd;
  bool adsAreWatched = false;
}

class _LocalNotifications {
  final instance = FlutterLocalNotificationsPlugin();
  final reminderChannel = NotificationChannelInfo(
    "my_prophet_remind", // id
    "My Horoscope, Reminder", // name that displayed in smartphone settings
    "My Horoscope app notifications channel for reminders.", // description
  );
}

Future<bool> internetCheck() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (_) {}
  return false;
}
