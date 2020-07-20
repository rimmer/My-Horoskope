import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_poll_event.dart';
part 'user_poll_state.dart';

class UserPollBloc extends Bloc<UserPollEvent, UserPollState> {
  @override
  UserPollState get initialState => throw UnimplementedError();

  @override
  Stream<UserPollState> mapEventToState(
    UserPollEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
