import 'package:equatable/equatable.dart';
import 'package:user_model/user_model.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class ReloadEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthEvent extends AuthenticationEvent {
  final UserModel model;
  AuthEvent(this.model);
  @override
  List<Object> get props => [model];
}
