import 'dart:convert';

import 'package:prophecies_repository/prophecies_repository.dart';

class PropheciesRepositoryJson implements PropheciesRepository {
  final Future<String> jsonString;

  PropheciesRepositoryJson(this.jsonString);

  @override
  Future<void> add(ProphecyEntity prophecy) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(ProphecyEntity prophecy) {
    throw UnimplementedError();
  }

  @override
  Stream<List<ProphecyEntity>> get prophecies async* {
    final parsed = jsonDecode(await jsonString).cast<Map<String, dynamic>>();
    final list = parsed
        .map<ProphecyEntity>((json) => ProphecyEntity.fromJson(json))
        .toList();
    yield list;
  }

  @override
  Future<void> update(ProphecyEntity prophecy) {
    throw UnimplementedError();
  }
}
