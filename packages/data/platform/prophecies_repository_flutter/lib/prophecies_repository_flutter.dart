library prophecies_repository_flutter;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:prophecies_repository/prophecies_repository.dart';
import 'src/json.dart';

class PropheciesRepositoryFlutter extends PropheciesRepository {
  PropheciesRepository _jsonProvider;

  static const _PROPHECIES_JSON_FILE =
      "packages/prophecies_repository_flutter/data/prophecies.json";

  PropheciesRepositoryFlutter(BuildContext context) {
    AssetBundle bundle = DefaultAssetBundle.of(context);
    _jsonProvider =
        PropheciesRepositoryJson(bundle.loadString(_PROPHECIES_JSON_FILE));
  }

  @override
  Future<void> add(ProphecyModel prophecy) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(ProphecyModel prophecy) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(ProphecyModel prophecy) {
    throw UnimplementedError();
  }

  @override
  Stream<List<ProphecyModel>> get prophecies => _jsonProvider.prophecies;
}
