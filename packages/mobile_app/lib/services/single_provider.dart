import 'package:base/user/repository/interface.dart';
import 'package:base/user/auth/bloc/bloc.dart';
import 'package:base/prophecy/bloc/bloc.dart';
import 'package:base/preferences/interface.dart';
import 'predictions.dart';

export 'package:base/user/repository/interface.dart';
export 'package:base/user/auth/bloc/bloc.dart';
export 'package:base/prophecy/bloc/bloc.dart';
export 'package:base/preferences/interface.dart';
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
}
