import 'package:equatable/equatable.dart';
import 'package:user_model/user_model.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthEvent extends AuthenticationEvent {
  final UserModel model;
  final bool internalStrIsEnabled;
  final bool moodletIsEnabled;
  final bool ambitionIsEnabled;
  final bool intelligenceIsEnabled;
  final bool luckIsEnabled;
  AuthEvent(
    this.model, {
    this.internalStrIsEnabled = true,
    this.moodletIsEnabled = true,
    this.ambitionIsEnabled = true,
    this.intelligenceIsEnabled = true,
    this.luckIsEnabled = true,
  });
  @override
  List<Object> get props => [model];
}
