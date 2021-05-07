import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'item.g.dart';

@JsonSerializable()
@immutable
class LocaleSettings {
  final String language;

  const LocaleSettings({this.language = "none"});

  Map<String, Object> toJson() => _$LocaleSettingsToJson(this);

  static LocaleSettings fromJson(Map<String, Object> json) =>
      _$LocaleSettingsFromJson(json);
}
