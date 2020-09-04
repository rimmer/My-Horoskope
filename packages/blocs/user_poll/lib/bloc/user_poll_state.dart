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
class UserPollLoadingState extends UserPollState {}

@ToString()
class UserPollIsDisabled extends UserPollState {}

@ToString()
class UserPollLoadingErrorState extends UserPollState {}

@ToString()
class UserPollIsVotedState extends UserPollState {}

@ToString()
class UserPollIsComplexState extends UserPollState {}

@ToString()
class UserPollIsSimpleState extends UserPollState {}
