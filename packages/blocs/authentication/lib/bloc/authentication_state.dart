import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';
import 'package:users/users.dart';

part 'authentication_state.g.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class Uninitialized extends InitialAuthenticationState {}

@ToString()
class Authenticated extends InitialAuthenticationState {
  final User user;

  Authenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => _$AuthenticatedToString(this);
}

class Unauthenticated extends InitialAuthenticationState {}
