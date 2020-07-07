import 'dart:async';

import 'package:prophecy_model/prophecy_model.dart';

abstract class PropheciesDataProvider {
  Future<void> addNewProphecy(ProphecyModel prophecy);

  Future<void> deleteProphecy(ProphecyModel prophecy);

  Stream<List<ProphecyModel>> prophecies();

  Future<void> updateProphecy(ProphecyModel prophecy);
}
