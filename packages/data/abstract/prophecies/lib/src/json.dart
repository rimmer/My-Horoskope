import 'dart:convert';

import 'package:prophecy_model/prophecy_model.dart';
import 'prophecies.dart';

class PropheciesJson implements Prophecies {
  final Future<String> jsonString;

  PropheciesJson(this.jsonString);

  @override
  Future<void> add(ProphecyModel prophecy) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(ProphecyModel prophecy) {
    throw UnimplementedError();
  }

  @override
  Stream<List<ProphecyModel>> get prophecies async* {
    final parsed = jsonDecode(await jsonString).cast<Map<String, dynamic>>();
    final list = parsed
        .map<ProphecyModel>((json) => ProphecyModel.fromJson(json))
        .toList();
    yield list;
  }

  @override
  Future<void> update(ProphecyModel prophecy) {
    throw UnimplementedError();
  }
}
