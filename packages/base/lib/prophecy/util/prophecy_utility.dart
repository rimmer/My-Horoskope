import 'package:meta/meta.dart';
import '../entity/prophecy.dart';
import '../../algorithm_interface.dart';

class ProphecyUtility {
  final AlgorithmInterface algo;
  Map<ProphecyType, ProphecyEntity> _current;
  Map<ProphecyType, ProphecyEntity> get current => _current;

  ProphecyUtility(this.algo);

  calculate({@required int dt, bool isDebug = false}) {
    _current = limitProphecies(
      //
      prophecies: algo.ask(aboutDay: dt, isDebug: isDebug),
      //
      min: PROPHECY_VALUE_LIMIT_MIN,
      max: PROPHECY_VALUE_LIMIT_MAX,
    );
    return _current;
  }
}
