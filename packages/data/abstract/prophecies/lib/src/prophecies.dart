import 'package:prophecy_model/prophecy_model.dart';

abstract class Prophecies {
  Future<void> add(ProphecyModel prophecy);

  Future<void> delete(ProphecyModel prophecy);

  Future<void> update(ProphecyModel prophecy);

  Stream<List<ProphecyModel>> get prophecies;
}
