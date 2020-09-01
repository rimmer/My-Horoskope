import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:userpoll/userpoll.dart';
import 'package:to_string/to_string.dart';

part 'user_poll_event.g.dart';

@immutable
abstract class UserPollEvent extends Equatable {
  final bool enabled;
  UserPoll get poll;
  const UserPollEvent() : enabled = true;

  @override
  List<Object> get props => [poll];
}

@ToString()
class PollNotUsed extends UserPollEvent {
  final enabled;
  final poll;
  PollNotUsed({@required this.enabled, @required this.poll});
  @override
  String toString() => _$PollNotUsedToString(this);
}

@ToString()
class PollUsed extends UserPollEvent {
  final enabled;
  final poll;
  PollUsed({@required this.poll, @required this.enabled});
  @override
  String toString() => _$PollUsedToString(this);
}

@ToString()
class PollSimple extends UserPollEvent {
  final poll;
  PollSimple({@required this.poll});
  @override
  String toString() => _$PollSimpleToString(this);
}

@ToString()
class PollComplex extends UserPollEvent {
  final poll;
  PollComplex({@required this.poll});
  @override
  String toString() => _$PollComplexToString(this);
}
