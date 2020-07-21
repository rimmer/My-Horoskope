import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:userpoll/userpoll.dart';

import 'user_poll_event.dart';
import 'user_poll_state.dart';
export 'user_poll_event.dart';
export 'user_poll_state.dart';

class UserPollBloc extends Bloc<UserPollEvent, UserPollState> {
  UserPoll currentPoll;
  UserPollBloc({@required this.currentPoll});

  @override
  UserPollState get initialState => UserPollInitial(poll: this.currentPoll);

  @override
  Stream<UserPollState> mapEventToState(
    UserPollEvent event,
  ) async* {
    switch (event.runtimeType) {
      case PollUsed:
        this.currentPoll = event.poll;
        yield UserPollChanged(poll: event.poll);
        break;
      case PollNotUsed:
      default:
        yield UserPollInitial(poll: this.currentPoll);
        break;
    }
  }
}
