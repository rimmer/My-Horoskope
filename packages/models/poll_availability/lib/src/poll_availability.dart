import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poll_availability.g.dart';

@JsonSerializable()
class PollAvailability {
  bool _switcher;
  PollAvailability({@required bool value}) : _switcher = value;

  void swtch({Function actions}) {
    _switcher = !_switcher;
    if (actions != null) actions();
  }

  bool get value => _switcher;

  Map<String, Object> toJson() => _$PollAvailabilityToJson(this);

  static PollAvailability fromJson(Map<String, Object> json) =>
      _$PollAvailabilityFromJson(json);
}
