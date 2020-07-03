
import 'dart:convert';

import 'package:prophecies_repository/src/data/prophecies_data_provider.dart';

import '../../../prophecies_repository.dart';

class PropheciesJsonDataProvider implements PropheciesDataProvider {

  final Future<String> jsonString;

  PropheciesJsonDataProvider(this.jsonString);

  @override
  Future<void> addNewProphecy(Prophecy prophecy) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProphecy(Prophecy prophecy) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Prophecy>> prophecies() async* {
    final parsed = jsonDecode(await jsonString).cast<Map<String, dynamic>>();
    final list = parsed.map<Prophecy>(
            (json) => Prophecy.fromJson(json)
    ).toList();
    yield list;
  }

  @override
  Future<void> updateProphecy(Prophecy prophecy) {
    throw UnimplementedError();
  }

}