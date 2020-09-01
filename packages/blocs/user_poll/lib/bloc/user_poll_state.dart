import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:userpoll/userpoll.dart';
import 'package:to_string/to_string.dart';

part 'user_poll_state.g.dart';

@immutable
abstract class UserPollState extends Equatable {
  final bool enabled;
  final bool isSimple;
  UserPoll get poll;
  const UserPollState()
      : isSimple = true,
        enabled = true;

  @override
  List<Object> get props => [poll, isSimple, enabled];
}

@ToString()
class UserPollInitial extends UserPollState {
  final bool enabled;
  final bool isSimple;
  final poll;
  UserPollInitial(
      {@required this.enabled, @required this.poll, @required this.isSimple});
  @override
  String toString() => _$UserPollInitialToString(this);
}

@ToString()
class UserPollChanged extends UserPollState {
  final bool enabled;
  final bool isSimple;
  final poll;
  UserPollChanged(
      {@required this.enabled, @required this.poll, @required this.isSimple});
  @override
  String toString() => _$UserPollChangedToString(this);
}
