import 'package:base/preferences/setting/locale/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'item.g.dart';

@JsonSerializable()
@immutable
class LocaleSettings {
  final String language;

  const LocaleSettings({this.language = "none"});

  Map<String, Object> toJson() => _$LocaleSettingsToJson(this);

  static LocaleSettings fromJson(Map<String, Object> json) {
    var locale = _$LocaleSettingsFromJson(json);
    // this is for upgrade from older versions
    // we set locale if "none" had been save priorly
    if (locale.language == "none") {
      locale = LocaleSettings(language: guessLocaleFromSystem());
    }
    return locale;
  }
}
