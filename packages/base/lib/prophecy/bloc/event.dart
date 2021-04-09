import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';

part 'event.g.dart';

@immutable
abstract class ProphecyEvent extends Equatable {
  int get dt;
  bool get isDebug;
  const ProphecyEvent();
}

@ToString()
class CalculateProphecy extends ProphecyEvent {
  final int dt;
  final bool isDebug;
  CalculateProphecy(this.dt, {this.isDebug = false});

  @override
  List<Object> get props => [dt];
  @override
  String toString() => _$CalculateProphecyToString(this);
}
