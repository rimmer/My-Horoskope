import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/interface.dart';
import '../../repository/interface.dart';

import 'event.dart';
import 'state.dart';
export 'event.dart';
export 'state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // singleton
  AuthenticationBloc._({@required this.auth});
  // ignore: close_sinks
  static AuthenticationBloc _authenticationBloc;
  factory AuthenticationBloc({@required Auth auth}) {
    if (_authenticationBloc == null)
      _authenticationBloc = AuthenticationBloc._(auth: auth);
    return _authenticationBloc;
  }

  @override
  AuthenticationState get initialState => Uninitialized();
  final Auth auth;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is AuthEvent) {
      yield* _mapAuthEventToState(event.model);
    }
  }

  /// tries to use initializing methods
  /// from auth data controller
  /// on the app start
  /// if authenticated user was found
  /// return state Authenticated
  /// return Unauthenticated otherwise
  Stream<AuthenticationState> _mapAppStartedToState() async* {
    /// if some user isn't already authenticated
    if (!await auth.isAuthenticated) {
      //
      /// auth initilization methods are used here
      final user = await auth.initialize;

      /// if authd user is found/not found
      if (user == null)
        yield Unauthenticated();
      else {
        /// must print user data from Transition
        yield Authenticated(user);
      }
    } else {
      yield Authenticated(auth.curUser);
    }
  }

  Stream<AuthenticationState> _mapAuthEventToState(UserModel model) async* {
    /// use auth authentication methods
    /// to login with given user model
    /// or create new Entity from it
    final user = await auth.authenticate(model);
    if (user == null)

      /// on any error user will be equal null
      yield Unauthenticated();
    else {
      yield Authenticated(user);
    }
  }
}
