import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:userpoll/userpoll.dart';
import 'package:to_string/to_string.dart';

part 'user_poll_state.g.dart';

@immutable
abstract class UserPollState extends Equatable {
  UserPoll get poll;
  const UserPollState();

  @override
  List<Object> get props => [poll];
}

@ToString()
class UserPollInitial extends UserPollState {
  final poll;
  UserPollInitial({@required this.poll});
  @override
  String toString() => _$UserPollInitialToString(this);
}

@ToString()
class UserPollChanged extends UserPollState {
  final poll;
  UserPollChanged({@required this.poll});
  @override
  String toString() => _$UserPollChangedToString(this);
}
