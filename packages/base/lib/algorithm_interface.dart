import 'package:base/user/entity/user.dart';
import 'package:meta/meta.dart';
import 'prophecy/entity/prophecy.dart';

const double PROPHECY_VALUE_LIMIT_MIN = 27.0;
const double PROPHECY_VALUE_LIMIT_MAX = 100.0;

abstract class AlgorithmInterface {
  Map<ProphecyType, ProphecyEntity> ask(
      {@required int aboutDay,
      bool isDebug = false,
      @required UserEntity user});
}
