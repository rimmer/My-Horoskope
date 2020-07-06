import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'data/json/prophecies_json_data_provider.dart';
import 'package:prophecy_model/prophecy_model.dart';

class PropheciesRepository {
  static const _PROPHECIES_JSON_FILE =
      "packages/local_database/data/prophecies.json";

  PropheciesJsonDataProvider _jsonProvider;

  PropheciesRepository(BuildContext context) {
    AssetBundle bundle = DefaultAssetBundle.of(context);
    _jsonProvider =
        PropheciesJsonDataProvider(bundle.loadString(_PROPHECIES_JSON_FILE));
  }

  Stream<List<ProphecyModel>> prophecies() => _jsonProvider.prophecies();

// Future<void> addNewProphecy(Prophecy prophecy);

// Future<void> deleteProphecy(Prophecy prophecy);

// Future<void> updateProphecy(Prophecy prophecy);
}
