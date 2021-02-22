import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:storage_access/storage_access.dart' as storage;

part 'status_file.g.dart';

const _fileName = "status_file.json";

@JsonSerializable()
class StatusFile {
  /// fields
  bool calendarNotationClicked;

  /// constructor
  StatusFile({this.calendarNotationClicked = false});

  /// json
  Map<String, Object> toJson() => _$StatusFileToJson(this);

  static StatusFile fromJson(Map<String, Object> json) =>
      _$StatusFileFromJson(json);

  /// write and read
  Future<bool> write() async => await storage.write(
        data: json.encode(this.toJson()),
        asFile: _fileName,
      );

  /// looks weird, but works and errorproof
  Future<StatusFile> read() async {
    try {
      //
      final red = await storage.read(fromFile: _fileName);
      if (red == null) {
        await this.write();
        return this;
      }

      return StatusFile.fromJson(json.decode(red));

      //
    } catch (_) {
      print("Error was catched when reading $_fileName file: $_");
      this.write();
      return this;
    }
  }
}
