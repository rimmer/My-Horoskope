import 'dart:io';
import 'dart:math';

import 'package:base/preferences/interface.dart';
import 'package:base/prophecy/util/prophecy_utility.dart';
import 'package:base/user/auth/bloc/bloc.dart';
import 'package:base/user/repository/interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'logic/ads.dart';
import 'logic/localization/predictions.dart';

export 'package:base/preferences/interface.dart';
export 'package:base/prophecy/util/prophecy_utility.dart';
export 'package:base/user/auth/bloc/bloc.dart';
export 'package:base/user/repository/interface.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'logic/localization/predictions.dart';

class _Tester {
  // final MutableBool testerField = MutableBool(false);
  final MutableBool testerField = MutableBool(!kReleaseMode);

  //
  bool get isDebug => testerField.wrapped;
  bool get isNotDebug => !testerField.wrapped;
}

class AppGlobal {
  static Random rand = Random.secure();

  /// data
  static _AppGlobalData data = _AppGlobalData();

  /// blocs
  // ignore: close_sinks
  static AuthenticationBloc authBloc;

  static ProphecyUtility prophecyUtil;

  /// services
  static _Firebase firebase = _Firebase();
  static _Tester debug = _Tester();
  static _LocalNotifications notifications = _LocalNotifications();

  /// ads
  static _Ads ads = _Ads();

  static get internetAvailable async => await internetCheck();

  /// getters
  static bool get adsDisabled => debug.isDebug;
}

class _AppGlobalData {
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
  bool adsWatched = false;
  bool adsLoaded = true;
  bool adsConsentGiven = false;
  bool adsConsentNeeded = false;
  AdsManager manager;
}

class _LocalNotifications {
  final instance = FlutterLocalNotificationsPlugin();
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
