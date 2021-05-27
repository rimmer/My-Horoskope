import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'item.g.dart';

@JsonSerializable()
@immutable
class NotificationsPreferences {
  final bool disabled;

  const NotificationsPreferences({this.disabled = false});

  Map<String, Object> toJson() => _$NotificationsPreferencesToJson(this);

  static NotificationsPreferences fromJson(Map<String, Object> json) =>
      _$NotificationsPreferencesFromJson(json);
}
