import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:prophecies/prophecies.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:to_string/to_string.dart';

part 'prophecy_state.g.dart';

@immutable
abstract class ProphecyState extends Equatable {
  final Map<ProphecyType, ProphecyEntity> prophecy;
  const ProphecyState() : prophecy = null;
  double get propheciesSum {
    double sum = 0.0;
    prophecy.forEach((key, value) {
      sum += value.value;
    });
    return sum;
  }

  @override
  List<Object> get props => [prophecy];
}

@ToString()
class ProphecyInitial extends ProphecyState {
  @override
  String toString() => _$ProphecyInitialToString(this);
}

@ToString()
class ProphecyWasAsked extends ProphecyState {
  final Map<ProphecyType, ProphecyEntity> prophecy;
  ProphecyWasAsked(this.prophecy);

  @override
  List<Object> get props => [prophecy];
  @override
  String toString() => _$ProphecyWasAskedToString(this);
}

@ToString()
class ProphecyWasClarified extends ProphecyState {
  final Map<ProphecyType, ProphecyEntity> prophecy;
  ProphecyWasClarified(this.prophecy);

  @override
  List<Object> get props => [prophecy];
  @override
  String toString() => _$ProphecyWasClarifiedToString(this);
}
