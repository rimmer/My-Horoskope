import 'dart:convert';
import 'package:prophecy_to_show/prophecy_to_show.dart';
import 'package:prophecy_to_show_storage/prophecy_to_show_storage.dart';
import 'package:storage_access/storage_access.dart' as storage;

const String _fileName = "propheciesToShow.json";

class ProphecyToShowStorageJson implements ProphecyToShowStorage {
  EnabledProphecies _ep;

  @override
  Future write() async => await storage.write(
        data: json.encode(_ep.toJson()),
        asFile: _fileName,
      );

  @override
  Future load() async {
    try {
      //
      final red = await storage.read(fromFile: _fileName);
      if (red == null) {
        await this.write();
        return;
      }

      final redDecoded = EnabledProphecies.fromJson(json.decode(red));
      _ep = redDecoded;

      //
    } catch (_) {
      print("Error was catched when reading $_fileName file: $_");
      _ep = EnabledProphecies();
      this.write();
    }
  }

  @override
  EnabledProphecies get enabledProphecies => _ep;

  @override
  set enabledProphecies(EnabledProphecies newVal) {
    _ep = newVal;
    this.write();
  }
}
