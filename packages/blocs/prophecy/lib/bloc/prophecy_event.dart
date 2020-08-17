import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';
import 'package:userpoll/userpoll.dart';

part 'prophecy_event.g.dart';

@immutable
abstract class ProphecyEvent extends Equatable {
  int get dt;
  UserPoll get poll;
  const ProphecyEvent();
}

@ToString()
class CalculateProphecy extends ProphecyEvent {
  final int dt;
  UserPoll get poll => null;
  CalculateProphecy(this.dt);

  @override
  List<Object> get props => [dt];
  @override
  String toString() => _$CalculateProphecyToString(this);
}

@ToString()
class ClarifyProphecy extends ProphecyEvent {
  final int dt;
  final UserPoll poll;
  ClarifyProphecy({this.dt, this.poll});

  @override
  List<Object> get props => [poll, dt];
  @override
  String toString() => _$ClarifyProphecyToString(this);
}
