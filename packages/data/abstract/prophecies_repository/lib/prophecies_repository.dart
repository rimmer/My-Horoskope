library prophecies_repository;

import 'src/prophecy.dart';
export 'src/prophecy.dart';

abstract class PropheciesRepository {
  Future<void> add(ProphecyEntity prophecy);

  Future<void> delete(ProphecyEntity prophecy);

  Future<void> update(ProphecyEntity prophecy);

  Stream<List<ProphecyEntity>> get prophecies;
}
