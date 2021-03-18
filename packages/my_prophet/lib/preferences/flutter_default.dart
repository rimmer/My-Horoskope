import 'dart:convert';
import 'package:storage_access/storage_access.dart' as storage;
import 'interface.dart';

const String _fileName = "app_prefrences.json";

class AppPreferencesFlutter extends AppPreferences {
  Future save() async => await storage.write(
        data: json.encode(dat.toJson()),
        asFile: _fileName,
      );

  Future load() async {
    try {
      //
      final red = await storage.read(fromFile: _fileName);
      if (red == null) {
        await this.save();
        return;
      }

      final redDecoded = AppPreferencesDat.fromJson(json.decode(red));
      dat = redDecoded;

      //
    } catch (_) {
      print("Error was catched when reading $_fileName file: $_");
      dat = AppPreferencesDat();
      this.save();
    }
  }
}
