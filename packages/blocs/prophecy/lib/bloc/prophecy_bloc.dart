import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prophecy/bloc.dart';

import 'package:algorithm/interface.dart';
import 'package:userpoll/userpoll.dart';

import 'prophecy_event.dart';
import 'prophecy_state.dart';
export 'prophecy_event.dart';
export 'prophecy_state.dart';

class ProphecyBloc extends Bloc<ProphecyEvent, ProphecyState> {
  /// algorithm that will calculate prophecies
  /// and already has needed, loaded data
  final Algorithm algo;
  ProphecyBloc({@required this.algo});

  ProphecyState get initialState => ProphecyInitial();

  Stream<ProphecyState> _calculateProphecy({@required int dt}) async* {
    final prophecy = await algo.ask(aboutDay: dt);
    if (prophecy != null) yield ProphecyWasAsked(prophecy);
  }

  Stream<ProphecyState> _clarifyProphecy(
      {@required int dt, @required UserPoll withPoll}) async* {
    if (withPoll != null) {
      final prophecy = algo.clarify(withPoll: withPoll, dt: dt);
      if (prophecy != null) yield ProphecyWasClarified(prophecy);
    }
  }

  @override
  Stream<ProphecyState> mapEventToState(
    ProphecyEvent event,
  ) async* {
    switch (event.runtimeType) {
      case CalculateProphecy:
        yield* _calculateProphecy(dt: event.dt);
        break;

      case ClarifyProphecy:
        yield* _clarifyProphecy(dt: event.dt, withPoll: event.poll);
        break;
    }
  }
}
