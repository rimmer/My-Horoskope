import 'package:base/user/repository/interface.dart';
import 'package:base/user/auth/bloc/bloc.dart';
import 'package:base/prophecy/bloc/bloc.dart';
import 'package:base/preferences/interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'predictions.dart';

export 'package:base/user/repository/interface.dart';
export 'package:base/user/auth/bloc/bloc.dart';
export 'package:base/prophecy/bloc/bloc.dart';
export 'package:base/preferences/interface.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'predictions.dart';

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
  FirebaseAnalytics firebaseAnalytics;

  //
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
