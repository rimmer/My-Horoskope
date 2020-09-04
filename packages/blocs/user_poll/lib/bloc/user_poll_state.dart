import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';

part 'user_poll_state.g.dart';

@immutable
abstract class UserPollState extends Equatable {
  @override
  List<Object> get props => [];
}

@ToString()
class UserPollLoadingState extends UserPollState {
  String toString() => _$UserPollLoadingStateToString(this);
}

@ToString()
class UserPollIsDisabled extends UserPollState {
  String toString() => _$UserPollIsDisabledToString(this);
}

@ToString()
class UserPollLoadingErrorState extends UserPollState {
  String toString() => _$UserPollLoadingErrorStateToString(this);
}

@ToString()
class UserPollIsVotedState extends UserPollState {
  String toString() => _$UserPollIsVotedStateToString(this);
}

@ToString()
class UserPollIsComplexState extends UserPollState {
  String toString() => _$UserPollIsComplexStateToString(this);
}

@ToString()
class UserPollIsSimpleState extends UserPollState {
  String toString() => _$UserPollIsSimpleStateToString(this);
}
