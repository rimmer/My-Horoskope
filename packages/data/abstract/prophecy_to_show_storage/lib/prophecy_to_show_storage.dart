import 'package:prophecy_to_show/prophecy_to_show.dart';

abstract class ProphecyToShowStorage {
  EnabledProphecies get enabledProphecies;
  set enabledProphecies(EnabledProphecies newVal);

  Future write();
  Future load();
}
