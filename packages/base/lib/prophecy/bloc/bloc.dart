import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../entity/prophecy.dart';
import '../../algorithm_interface.dart';

import 'event.dart';
import 'state.dart';
export 'event.dart';
export 'state.dart';

class ProphecyBloc extends Bloc<ProphecyEvent, ProphecyState> {
  // singleton
  ProphecyBloc._({@required this.algo});
  // ignore: close_sinks
  static ProphecyBloc _prophecyBloc;
  factory ProphecyBloc({@required AlgorithmInterface algo}) {
    if (_prophecyBloc == null) _prophecyBloc = ProphecyBloc._(algo: algo);
    return _prophecyBloc;
  }

  /// algorithm that will calculate prophecies
  /// and already has needed, loaded data
  final AlgorithmInterface algo;
  ProphecyState currentState;

  ProphecyState get initialState => ProphecyInitial();

  Stream<ProphecyState> _calculateProphecy(
      {@required int dt, bool isDebug = false}) async* {
    final prophecy = limitProphecies(
      //
      prophecies: algo.ask(aboutDay: dt, isDebug: isDebug),
      //
      min: PROPHECY_VALUE_LIMIT_MIN,
      max: PROPHECY_VALUE_LIMIT_MAX,
    );

    //
    if (prophecy != null) yield ProphecyWasAsked(prophecy);
  }

  @override
  Stream<ProphecyState> mapEventToState(
    ProphecyEvent event,
  ) async* {
    yield ProphecyInitial();
    switch (event.runtimeType) {
      case CalculateProphecy:
        yield* _calculateProphecy(dt: event.dt, isDebug: event.isDebug);
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
