import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_poll/bloc.dart';
import 'package:userpoll/userpoll.dart';

import 'user_poll_event.dart';
import 'user_poll_state.dart';
export 'user_poll_event.dart';
export 'user_poll_state.dart';

class UserPollBloc extends Bloc<UserPollEvent, UserPollState> {
  bool _isSimple = true;
  bool get isSimple => _isSimple;
  UserPoll currentPoll;
  bool enabled;
  UserPollBloc({@required this.enabled, @required this.currentPoll});

  @override
  UserPollState get initialState => UserPollInitial(
      poll: this.currentPoll, isSimple: isSimple, enabled: this.enabled);

  @override
  Stream<UserPollState> mapEventToState(
    UserPollEvent event,
  ) async* {
    switch (event.runtimeType) {
      case PollSimple:
        _isSimple = true;
        yield UserPollChanged(
            poll: event.poll, isSimple: _isSimple, enabled: this.enabled);
        break;
      case PollComplex:
        _isSimple = false;
        yield UserPollChanged(
            poll: event.poll, isSimple: _isSimple, enabled: this.enabled);
        break;
      case PollUsed:
        this.currentPoll = event.poll;
        this.enabled = event.enabled;
        yield UserPollChanged(
            poll: event.poll, isSimple: _isSimple, enabled: event.enabled);
        break;
      case PollNotUsed:
      default:
        yield UserPollInitial(
            poll: this.currentPoll, isSimple: _isSimple, enabled: this.enabled);
        break;
    }
  }
}
