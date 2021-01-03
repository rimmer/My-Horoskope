import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy/bloc.dart';

import 'package:algorithm/interface.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:userpoll/userpoll.dart';

import 'prophecy_event.dart';
import 'prophecy_state.dart';
export 'prophecy_event.dart';
export 'prophecy_state.dart';

const double PROPHECY_VALUE_LIMIT_MIN = 27.0;
const double PROPHECY_VALUE_LIMIT_MAX = 100.0;

class ProphecyBloc extends Bloc<ProphecyEvent, ProphecyState> {
  /// algorithm that will calculate prophecies
  /// and already has needed, loaded data
  final Algorithm algo;
  ProphecyBloc({@required this.algo});

  ProphecyState get initialState => ProphecyInitial();

  Stream<ProphecyState> _calculateProphecy({@required int dt}) async* {
    //
    final prophecy = limitProphecies(
      //
      prophecies: await algo.ask(aboutDay: dt),
      //
      min: PROPHECY_VALUE_LIMIT_MIN,
      max: PROPHECY_VALUE_LIMIT_MAX,
    );

    //
    if (prophecy != null) yield ProphecyWasAsked(prophecy);
  }

  Stream<ProphecyState> _clarifyProphecy(
      {@required int dt, @required UserPoll withPoll}) async* {
    if (withPoll != null) {
      //
      final prophecy = limitProphecies(
        //
        prophecies: await algo.clarify(withPoll: withPoll, dt: dt),
        //
        min: PROPHECY_VALUE_LIMIT_MIN,
        max: PROPHECY_VALUE_LIMIT_MAX,
      );

      //
      if (prophecy != null) yield ProphecyWasClarified(prophecy);
    }
  }

  @override
  Stream<ProphecyState> mapEventToState(
    ProphecyEvent event,
  ) async* {
    yield ProphecyInitial();
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

Map<ProphecyType, ProphecyEntity> limitProphecies(
    {@required Map<ProphecyType, ProphecyEntity> prophecies,
    @required double min,
    @required double max}) {
  //
  PropheciesMapLimit(prophecies)
      .limit(type: ProphecyType.INTERNAL_STRENGTH, min: min, max: max);
  PropheciesMapLimit(prophecies)
      .limit(type: ProphecyType.MOODLET, min: min, max: max);
  PropheciesMapLimit(prophecies)
      .limit(type: ProphecyType.AMBITION, min: min, max: max);
  PropheciesMapLimit(prophecies)
      .limit(type: ProphecyType.INTUITION, min: min, max: max);
  PropheciesMapLimit(prophecies)
      .limit(type: ProphecyType.LUCK, min: min, max: max);

  return prophecies;
}

extension PropheciesMapLimit on Map<ProphecyType, ProphecyEntity> {
  void limit(
      {@required ProphecyType type,
      @required double min,
      @required double max}) {
    //

    final unLimVal = this[type].value;

    if (unLimVal > max)
      this[type].value = max;
    else if (unLimVal < min) this[type].value = min;
  }
}
