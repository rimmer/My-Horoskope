import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';
import 'package:users_repository/users_repository.dart';

part 'user_poll_event.g.dart';

@immutable
abstract class UserPollEvent extends Equatable {
  UserEntity get user => null;
  bool get availability => false;
  bool get studying => false;
  @override
  List<Object> get props => [];
}

@ToString()
class UserPollRestartEvent extends UserPollEvent {
  String toString() => _$UserPollRestartEventToString(this);
}

@ToString()
class UserPollOnOffEvent extends UserPollEvent {
  final bool availability;
  final bool studying;
  UserPollOnOffEvent({@required this.availability, @required this.studying});
  @override
  List<Object> get props => [this.availability, this.studying];

  String toString() => _$UserPollOnOffEventToString(this);
}

@ToString()
class UserPollChangeUserEvent extends UserPollEvent {
  final UserEntity user;
  UserPollChangeUserEvent({@required UserEntity newUser}) : user = newUser;
  @override
  List<Object> get props => [this.user];

  String toString() => _$UserPollChangeUserEventToString(this);
}

@ToString()
class UserPollSwitchSimpleEvent extends UserPollEvent {
  String toString() => _$UserPollSwitchSimpleEventToString(this);
}

@ToString()
class UserPollSwitchComplexEvent extends UserPollEvent {
  String toString() => _$UserPollSwitchComplexEventToString(this);
}

@ToString()
class UserPollVoteEvent extends UserPollEvent {
  String toString() => _$UserPollVoteEventToString(this);
}
