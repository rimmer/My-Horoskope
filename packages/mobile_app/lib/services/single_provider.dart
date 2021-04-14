import 'package:base/user/repository/interface.dart';
import 'package:base/user/auth/bloc/bloc.dart';
import 'package:base/prophecy/bloc/bloc.dart';
import 'package:base/preferences/interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_prophet/components/user_settings/index.dart';
import 'package:my_prophet/screens/daily/screen/index.dart';
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

  _Tester._();
  static _Tester _tester;
  factory _Tester() {
    if (_tester == null) _tester = _Tester._();
    return _tester;
  }
}

/// single provider that cleans widget tree from providers nesting
class SingleProvider {
  // singleton
  SingleProvider._();
  static SingleProvider _singleProvider;
  factory SingleProvider() {
    if (_singleProvider == null) _singleProvider = SingleProvider._();
    return _singleProvider;
  }

  /// objects
  UsersRepository usersRepo;
  // ignore: close_sinks
  AuthenticationBloc authBloc;
  // ignore: close_sinks
  ProphecyBloc prophecyBloc;
  AppPreferences appPref;
  PredictionsFlutterMobile predictions;

  /// fields that needed between screens
  final firebase = _Firebase();
  final debug = _Tester();

  /// getters
  bool get adsAreDisabled => debug.isDebug;
}

class _Firebase {
  FirebaseAnalytics analytics;
  NotificationSettings notifications;
  FirebaseMessaging messaging;

  _Firebase._();
  static _Firebase _firebase;
  factory _Firebase() {
    if (_firebase == null) _firebase = _Firebase._();
    return _firebase;
  }
}
