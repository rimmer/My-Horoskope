library prophecies_flutter;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:prophecies/prophecies.dart';

class PropheciesFlutter extends Prophecies {
  PropheciesJson _jsonProvider;

  static const _PROPHECIES_JSON_FILE =
      "packages/prophecies_flutter/data/prophecies.json";

  PropheciesFlutter(BuildContext context) {
    AssetBundle bundle = DefaultAssetBundle.of(context);
    _jsonProvider = PropheciesJson(bundle.loadString(_PROPHECIES_JSON_FILE));
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
