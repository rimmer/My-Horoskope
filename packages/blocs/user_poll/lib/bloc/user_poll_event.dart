import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';
import 'package:users_repository/users_repository.dart';

part 'user_poll_event.g.dart';

@immutable
abstract class UserPollEvent extends Equatable {
  UserEntity get user => null;
  @override
  List<Object> get props => [];
}

@ToString()
class UserPollRestartEvent extends UserPollEvent {}

@ToString()
class UserPollEnableEvent extends UserPollEvent {}

@ToString()
class UserPollDisableEvent extends UserPollEvent {}

@ToString()
class UserPollChangeUserEvent extends UserPollEvent {
  final UserEntity user;
  UserPollChangeUserEvent({@required UserEntity newUser}) : user = newUser;
  @override
  List<Object> get props => [this.user];
}

@ToString()
class UserPollSwitchSimpleEvent extends UserPollEvent {}

@ToString()
class UserPollSwitchComplexEvent extends UserPollEvent {}

@ToString()
class UserPollVoteEvent extends UserPollEvent {}
