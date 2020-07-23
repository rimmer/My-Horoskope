import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'poll.g.dart';

enum PollModelType {
  MOOD,
  PRODUCTIVITY,
  RELATIONSHIPS,
  SELFDEVELOPMENT,
  PHYSICAL_ACTIVITY,
}

@JsonSerializable()
class PollModel {
  final PollModelType type;
  final int value;
  PollModel({@required this.type, this.value = 3});

  Map<String, Object> toJson() => _$PollModelToJson(this);

  static PollModel fromJson(Map<String, Object> json) =>
      _$PollModelFromJson(json);
}
