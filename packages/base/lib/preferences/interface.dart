import 'package:json_annotation/json_annotation.dart';

/// @settings
import 'setting/enabled_prophecies/item.dart';
import 'setting/locale/item.dart';

part 'interface.g.dart';

@JsonSerializable()
class AppPreferencesDat {
  /// @settings
  EnabledProphecies ep;
  LocaleSettings locale;

  AppPreferencesDat({this.ep, this.locale}) {
    /// @settings
    if (ep == null) ep = EnabledProphecies();
    if (locale == null) locale = LocaleSettings();
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

  LocaleSettings get locale => dat.locale;

  set locale(LocaleSettings newVal) {
    dat.locale = newVal;
    this.save();
  }
}
