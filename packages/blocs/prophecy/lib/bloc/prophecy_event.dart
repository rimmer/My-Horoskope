import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:prophecies_repository/prophecies_repository.dart';
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
  final ProphecyEntity prophecy;

  ProphecyUpdated(this.prophecy);

  @override
  List<Object> get props => [prophecy];

  @override
  String toString() => _$ProphecyUpdatedToString(this);
}

@ToString()
class PropheciesLoaded extends ProphecyEvent {
  final List<ProphecyEntity> prophecies;

  PropheciesLoaded(this.prophecies);

  @override
  List<Object> get props => [prophecies];

  @override
  String toString() => _$PropheciesLoadedToString(this);
}
