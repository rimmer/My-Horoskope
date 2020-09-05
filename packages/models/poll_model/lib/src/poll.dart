import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:poll_model/poll_model.dart';

part 'poll.g.dart';

/// Poll Model stores the value and type of user poles

/// may be expanded in future
enum PollModelType {
  MOOD,
  PRODUCTIVITY,
  RELATIONSHIPS,
  SELFDEVELOPMENT,
  PHYSICAL_ACTIVITY,
}

extension ToPollModel on String {
  PollModelType toPollModel() {
    switch (this) {
      case 'MOOD':
        return PollModelType.MOOD;
      case 'PRODUCTIVITY':
        return PollModelType.PRODUCTIVITY;
      case 'RELATIONSHIPS':
        return PollModelType.RELATIONSHIPS;
      case 'SELFDEVELOPMENT':
        return PollModelType.SELFDEVELOPMENT;
      case 'PHYSICAL_ACTIVITY':
        return PollModelType.PHYSICAL_ACTIVITY;
    }
  }
}

@JsonSerializable()
@immutable
class PollModel {
  /// what enum value to use
  final PollModelType type;

  /// value from one to six
  final int value;

  PollModel({@required this.type, this.value = 3});

  Map<String, Object> toJson() => _$PollModelToJson(this);

  static PollModel fromJson(Map<String, Object> json) =>
      _$PollModelFromJson(json);
}
