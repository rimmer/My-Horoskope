import 'package:json_annotation/json_annotation.dart';

/// @settings
import 'setting/enabled_prophecies/item.dart';

part 'interface.g.dart';

@JsonSerializable()
class AppPreferencesDat {
  /// @settings
  EnabledProphecies ep;

  AppPreferencesDat({this.ep}) {
    /// @settings
    if (ep == null) ep = EnabledProphecies();
  }

  Map<String, Object> toJson() => _$AppPreferencesDatToJson(this);

  static AppPreferencesDat fromJson(Map<String, Object> json) =>
      _$AppPreferencesDatFromJson(json);
}

abstract class AppPreferences {
  AppPreferencesDat dat;
  Future save();
  Future load();

  /// @settings
  /// setters and getters
  EnabledProphecies get enabledProphecies => dat.ep;

  set enabledProphecies(EnabledProphecies newVal) {
    dat.ep = newVal;
    this.save();
  }
}
