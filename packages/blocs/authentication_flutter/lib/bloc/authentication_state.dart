import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';

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
  final String userId;

  Authenticated(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => _$AuthenticatedToString(this);
}

class Unauthenticated extends InitialAuthenticationState {}
