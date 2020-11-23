import 'package:prophecy_to_show/prophecy_to_show.dart';
import 'package:prophecy_to_show_storage/prophecy_to_show_storage.dart';

import 'src/json_storage.dart';

class ProphecyToShowStorageFlutter implements ProphecyToShowStorage {
  ProphecyToShowStorage _storage = ProphecyToShowStorageJson();

  ProphecyToShowStorageFlutter() {
    _storage.load();
  }

  @override
  Future write() async => await _storage.write();

  @override
  Future load() async => await _storage.load();

  @override
  EnabledProphecies get enabledProphecies => _storage.enabledProphecies;
  @override
  set enabledProphecies(EnabledProphecies newVal) =>
      _storage.enabledProphecies = newVal;
}
