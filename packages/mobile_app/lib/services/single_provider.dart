import 'package:base/user/repository/interface.dart';
import 'package:base/user/auth/bloc/bloc.dart';
import 'package:base/prophecy/bloc/bloc.dart';
import 'package:base/preferences/interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
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
  final cards = _Cards();
  final debug = _Tester();
  final ads = _Ads();

  /// getters
  bool get adsAreDisabled => ads.disabled || debug.isDebug;
}

class _Firebase {
  _Firebase._();
  static _Firebase _firebase;
  factory _Firebase() {
    if (_firebase == null) _firebase = _Firebase._();
    return _firebase;
  }

  FirebaseAnalytics analytics;
}

class _Cards {
  _Cards._();
  static _Cards _cards;
  factory _Cards() {
    if (_cards == null) _cards = _Cards._();
    return _cards;
  }

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
  Widget currentCard = SizedBox();
  bool currentCardIsNan = true;
}

class _Ads {
  _Ads._();
  static _Ads _ads;
  factory _Ads() {
    if (_ads == null) _ads = _Ads._();
    return _ads;
  }

  /// we can add function to disable adds later
  final bool disabled = false;
}
