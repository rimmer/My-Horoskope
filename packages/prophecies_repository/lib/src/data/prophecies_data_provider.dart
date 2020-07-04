import 'dart:async';

import '../models/prophecy.dart';

abstract class PropheciesDataProvider {
  Future<void> addNewProphecy(Prophecy prophecy);

  Future<void> deleteProphecy(Prophecy prophecy);

  Stream<List<Prophecy>> prophecies();

  Future<void> updateProphecy(Prophecy prophecy);
}