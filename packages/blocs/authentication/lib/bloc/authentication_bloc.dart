import 'dart:async';
import 'dart:convert';

import 'package:authentication/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:auth/auth.dart';
import 'package:user_model/user_model.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';
export 'authentication_event.dart';
export 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => Uninitialized();
  final Auth _auth;

  AuthenticationBloc({@required Auth auth})
      : assert(auth != null),
        _auth = auth;

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

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    if (!await _auth.isAuthenticated) {
      final user = await _auth.initialize;
      if (user == null)
        yield Unauthenticated();
      else {
        print(json.encode(user.toJson()));
        yield Authenticated(user);
      }
    } else {
      yield Authenticated(_auth.curUser);
    }
  }

  Stream<AuthenticationState> _mapAuthEventToState(UserModel model) async* {
    final user = await _auth.authenticate(model);
    if (user == null)
      yield Unauthenticated();
    else {
      yield Authenticated(user);
    }
  }
}
