import 'package:equatable/equatable.dart';
import 'package:prophecies_repository/prophecies_repository.dart';
import 'package:to_string/to_string.dart';

part 'prophecy_state.g.dart';

abstract class ProphecyState extends Equatable {
  const ProphecyState();
}

class InitialProphecyState extends ProphecyState {
  @override
  List<Object> get props => [];
}

class ProphecyLoadInProgressState extends InitialProphecyState {}

@ToString()
class PropheciesLoadSuccessState extends InitialProphecyState {
  final List<Prophecy> prophecies;

  PropheciesLoadSuccessState([this.prophecies = const []]);

  @override
  List<Object> get props => [prophecies];

  @override
  String toString() => _$PropheciesLoadSuccessStateToString(this);
}

class ProphecyLoadFailureState extends InitialProphecyState {}