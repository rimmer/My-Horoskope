import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:userpoll/userpoll.dart';
import 'package:to_string/to_string.dart';

part 'user_poll_event.g.dart';

@immutable
abstract class UserPollEvent extends Equatable {
  @override
  List<Object> get props => [];
}
