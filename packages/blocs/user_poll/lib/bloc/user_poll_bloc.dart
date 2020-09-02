import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_poll/bloc.dart';
import 'package:userpoll/userpoll.dart';
import 'package:users_repository/users_repository.dart';
import 'package:polls_repository/polls_repository.dart';
import 'package:int_datetime/int_datetime.dart';

import 'user_poll_event.dart';
import 'user_poll_state.dart';
export 'user_poll_event.dart';
export 'user_poll_state.dart';

class UserPollBloc extends Bloc<UserPollEvent, UserPollState> {
  //
  final PollsRepository repo;
  UserEntity user;
  UserPoll current;
  bool loaded = false;

  UserPollBloc({@required this.repo, @required this.user, this.current}) {}

  @override
  Stream<UserPollState> mapEventToState(
    UserPollEvent event,
  ) async* {
    /// if already loaded
    if (loaded) {


    } else {
      /// if not loaded, but enabled
      if (user.pollAvailability) {

        yield* _load();

      /// if polls are disabled for this user
      } else {

        switch (event.runtimeType) {

          case UserPollEnableEvent:
            user.pollAvailability= true;

            yield UserPollInitState();
            break;
          
          case UserPollChangeUserEvent:
            user= event.user;
            loaded= false;

            yield UserPollInitState();
            break;
        }

      }
    }
  }

  Stream<UserPollState> _load() async* {
    /// show loading state
    yield UserPollLoadingState();

    //

    /// async loading
    final wasLoaded= await repo.load(user.id);

    /// if was not loaded correctly, show loading error state
    if (wasLoaded) {

      current = await repo.todayPoll;
      if (current == null) {
        /// if no todays poll saved, create one
        current= UserPoll(dt: dtDay, mood: 3);
        /// and add it to repo
        repo.todayPoll= current;
        /// and save it
        await repo.save(user.id);
      }
      loaded= true;

      yield UserPollInitState();

    } else {
      yield UserPollLoadingErrorState();
    }
  }

  @override
  UserPollState get initialState => ;
}
