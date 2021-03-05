import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:storage_access/storage_access.dart' as storage;

part 'app_preferences.g.dart';

const _fileName = "app_preferences.json";

@JsonSerializable()
class _AppPreferences {
  bool calendarNotationClicked;

  _AppPreferences({this.calendarNotationClicked = false});

  Map<String, Object> toJson() => _appPreferencesToJson(this);

  static _AppPreferences fromJson(Map<String, Object> json) =>
      _appPreferencesFromJson(json);
}

class AppPreferences {
  _AppPreferences preference;

  AppPreferences() {
    read();
  }

  Future<bool> write() async {
    if (preference == null) preference = _AppPreferences();

    await storage.write(
      data: json.encode(preference.toJson()),
      asFile: _fileName,
    );
  }

  Future read() async {
    try {
      //
      final red = await storage.read(fromFile: _fileName);
      if (red == null) {
        await this.write();
        return;
      }

      preference = _AppPreferences.fromJson(json.decode(red));
      //
    } catch (_) {
      print("Error was catched when reading $_fileName file: $_");
      this.write();
      return;
    }
  }
}
