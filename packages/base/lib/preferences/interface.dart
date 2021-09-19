import 'package:base/preferences/setting/locale/utils.dart';
import 'package:json_annotation/json_annotation.dart';

/// @settings
import 'setting/enabled_prophecies/item.dart';
import 'setting/locale/item.dart';
import 'setting/notifications/item.dart';

part 'interface.g.dart';

@JsonSerializable()
class AppPreferencesDat {
  /// @settings
  EnabledProphecies ep;
  LocaleSettings locale;
  NotificationsPreferences notifications;

  AppPreferencesDat({this.ep, this.locale, this.notifications}) {
    /// @settings
    if (ep == null) ep = EnabledProphecies();
    if (locale == null)
      locale = LocaleSettings(language: guessLocaleFromSystem());
    if (notifications == null) notifications = NotificationsPreferences();
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

  NotificationsPreferences get notifications => dat.notifications;

  set notifications(NotificationsPreferences newVal) {
    dat.notifications = newVal;
    this.save();
  }
}
