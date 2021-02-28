import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:storage_access/storage_access.dart' as storage;

part 'app_preferences.g.dart';

const _fileName = "app_preferences.json";

@JsonSerializable()
class AppPreferences {
  /// fields
  bool calendarNotationClicked;

  /// constructor
  AppPreferences({this.calendarNotationClicked = false});

  /// json
  Map<String, Object> toJson() => _$AppPreferencesToJson(this);

  static AppPreferences fromJson(Map<String, Object> json) =>
      _$AppPreferencesFromJson(json);

  /// write and read
  Future<bool> write() async => await storage.write(
        data: json.encode(this.toJson()),
        asFile: _fileName,
      );

  /// looks weird, but works and errorproof
  Future<AppPreferences> read() async {
    try {
      //
      final red = await storage.read(fromFile: _fileName);
      if (red == null) {
        await this.write();
        return this;
      }

      return AppPreferences.fromJson(json.decode(red));

      //
    } catch (_) {
      print("Error was catched when reading $_fileName file: $_");
      this.write();
      return this;
    }
  }
}
