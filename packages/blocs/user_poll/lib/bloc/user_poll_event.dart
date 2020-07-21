import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:userpoll/userpoll.dart';
import 'package:to_string/to_string.dart';

part 'user_poll_event.g.dart';

@immutable
abstract class UserPollEvent extends Equatable {
  UserPoll get poll;
  const UserPollEvent();

  @override
  List<Object> get props => [poll];
}

@ToString()
class PollNotUsed extends UserPollEvent {
  final poll;
  PollNotUsed({@required this.poll});
  @override
  String toString() => _$PollNotUsedToString(this);
}

@ToString()
class PollUsed extends UserPollEvent {
  final poll;
  PollUsed({@required this.poll});
  @override
  String toString() => _$PollUsedToString(this);
}
