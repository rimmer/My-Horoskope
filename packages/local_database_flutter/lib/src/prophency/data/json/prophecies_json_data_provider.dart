import 'dart:convert';

import '../prophecies_data_provider.dart';
import 'package:prophecy_model/prophecy_model.dart';

class PropheciesJsonDataProvider implements PropheciesDataProvider {
  final Future<String> jsonString;

  PropheciesJsonDataProvider(this.jsonString);

  @override
  Future<void> addNewProphecy(ProphecyModel prophecy) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProphecy(ProphecyModel prophecy) {
    throw UnimplementedError();
  }

  @override
  Stream<List<ProphecyModel>> prophecies() async* {
    final parsed = jsonDecode(await jsonString).cast<Map<String, dynamic>>();
    final list = parsed
        .map<ProphecyModel>((json) => ProphecyModel.fromJson(json))
        .toList();
    yield list;
  }

  @override
  Future<void> updateProphecy(ProphecyModel prophecy) {
    throw UnimplementedError();
  }
}
