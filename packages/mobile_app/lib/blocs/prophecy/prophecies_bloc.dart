import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:prophecy_model/prophecy_model.dart';

import './bloc.dart';

class PropheciesBloc extends Bloc<ProphecyEvent, ProphecyState> {
  final PropheciesRepository _repository;
  StreamSubscription _prophecySubscription;

  PropheciesBloc({@required repository})
      : assert(repository != null),
        _repository = repository;

  @override
  ProphecyState get initialState => ProphecyLoadInProgressState();

  @override
  Stream<ProphecyState> mapEventToState(
    ProphecyEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LoadProphecies:
        _mapLoadPropheciesToState();
        break;
      case PropheciesLoaded:
        yield* _mapPropheciesLoadedToState(event);
    }
  }

  void _mapLoadPropheciesToState() {
    _prophecySubscription?.cancel();
    _prophecySubscription = _repository
        .prophecies()
        .listen((prophecies) => add(PropheciesLoaded(prophecies)));
  }

  Stream<ProphecyState> _mapPropheciesLoadedToState(
      PropheciesLoaded event) async* {
    yield PropheciesLoadSuccessState(event.prophecies);
  }
}
