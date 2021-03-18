import 'package:meta/meta.dart';
import 'prophecy/entity/prophecy.dart';

abstract class AlgorithmInterface {
  Map<ProphecyType, ProphecyEntity> ask({@required int aboutDay});
}
