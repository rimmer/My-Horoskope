import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';
import '../../entity/user.dart';

part 'authentication_state.g.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

@ToString()
class Authenticated extends AuthenticationState {
  final UserEntity user;

  Authenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => _$AuthenticatedToString(this);
}

class Unauthenticated extends AuthenticationState {}
