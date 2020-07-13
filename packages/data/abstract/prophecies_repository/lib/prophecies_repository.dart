library prophecies_repository;

import 'package:prophecy_model/prophecy_model.dart';

abstract class PropheciesRepository {
  Future<void> add(ProphecyModel prophecy);

  Future<void> delete(ProphecyModel prophecy);

  Future<void> update(ProphecyModel prophecy);

  Stream<List<ProphecyModel>> get prophecies;
}
