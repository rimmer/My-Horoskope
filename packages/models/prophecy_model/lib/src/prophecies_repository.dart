import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'data/json/prophecies_json_data_provider.dart';
import 'models/prophecy.dart';

class PropheciesRepository {
  static const _PROPHECIES_JSON_FILE = "assets/data/prophecies.json";

  PropheciesJsonDataProvider _jsonProvider;

  PropheciesRepository(BuildContext context) {
    AssetBundle bundle = DefaultAssetBundle.of(context);
    _jsonProvider =
        PropheciesJsonDataProvider(bundle.loadString(_PROPHECIES_JSON_FILE));
  }

  Stream<List<Prophecy>> prophecies() => _jsonProvider.prophecies();

// Future<void> addNewProphecy(Prophecy prophecy);

// Future<void> deleteProphecy(Prophecy prophecy);

// Future<void> updateProphecy(Prophecy prophecy);
}
