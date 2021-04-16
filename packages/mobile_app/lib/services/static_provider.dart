import 'package:base/user/repository/interface.dart';
import 'package:base/user/auth/bloc/bloc.dart';
import 'package:base/prophecy/bloc/bloc.dart';
import 'package:base/preferences/interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_prophet/components/user_settings/index.dart';
import 'predictions.dart';

export 'package:base/user/repository/interface.dart';
export 'package:base/user/auth/bloc/bloc.dart';
export 'package:base/prophecy/bloc/bloc.dart';
export 'package:base/preferences/interface.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'predictions.dart';

class _Tester {
  // @DEBUG change false to true inside MutableBool
  final MutableBool testerField = MutableBool(false);
  //
  bool get isDebug => testerField.wrapped;
  bool get isNotDebug => !testerField.wrapped;
}

class StaticProvider {
  /// data
  static SPData data = SPData();

  /// blocs
  // ignore: close_sinks
  static AuthenticationBloc authBloc;
  // ignore: close_sinks
  static ProphecyBloc prophecyBloc;

  /// services
  static _Firebase firebase = _Firebase();
  static _Tester debug = _Tester();

  /// getters
  static bool get adsAreDisabled => debug.isDebug;
}

class SPData {
  UsersRepository usersRepo;
  AppPreferences appPref;
  PredictionsFlutterMobile predictions;
}

class _Firebase {
  FirebaseAnalytics analytics;
  NotificationSettings notifications;
  FirebaseMessaging messaging;
}
