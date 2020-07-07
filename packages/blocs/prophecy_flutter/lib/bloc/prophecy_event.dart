import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:to_string/to_string.dart';

part 'prophecy_event.g.dart';

@immutable
abstract class ProphecyEvent extends Equatable {
  const ProphecyEvent();

  @override
  List<Object> get props => [];
}

class LoadProphecies extends ProphecyEvent {}

@ToString()
class ProphecyUpdated extends ProphecyEvent {
  final ProphecyModel prophecy;

  ProphecyUpdated(this.prophecy);

  @override
  List<Object> get props => [prophecy];

  @override
  String toString() => _$ProphecyUpdatedToString(this);
}

@ToString()
class PropheciesLoaded extends ProphecyEvent {
  final List<ProphecyModel> prophecies;

  PropheciesLoaded(this.prophecies);

  @override
  List<Object> get props => [prophecies];

  @override
  String toString() => _$PropheciesLoadedToString(this);
}
