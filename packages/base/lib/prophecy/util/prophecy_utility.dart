import 'package:base/user/entity/user.dart';
import 'package:meta/meta.dart';
import '../entity/prophecy.dart';
import '../../algorithm_interface.dart';

class ProphecyUtility {
  final AlgorithmInterface algo;
  Map<ProphecyType, ProphecyEntity> _current;
  Map<ProphecyType, ProphecyEntity> get current => _current;

  ProphecyUtility(this.algo);

  Map<ProphecyType, ProphecyEntity> calculate(
      {@required int dt, bool isDebug = false, @required UserEntity user}) {
    _current = limitProphecies(
      //
      prophecies: algo.ask(aboutDay: dt, isDebug: isDebug, user: user),
      //
      min: PROPHECY_VALUE_LIMIT_MIN,
      max: PROPHECY_VALUE_LIMIT_MAX,
    );
    return _current;
  }

  double compatibility({
    @required int dt,
    @required UserEntity user,
    @required UserEntity subject,
  }) {
    final calcUser = this.calculate(dt: dt, user: user);
    final calcSubj = this.calculate(dt: dt, user: subject);

    double result = 10.0;

    /// overall health feeling (root chakra)
    result += calcUser[ProphecyType.ROOT].value * 0.1 +
        calcSubj[ProphecyType.ROOT].value * 0.1;

    /// overall happiness (sacral chakra)
    result += calcUser[ProphecyType.SACRAL].value * 0.1 +
        calcSubj[ProphecyType.SACRAL].value * 0.1;

    /// how positive are they today (heart chakra)
    result += calcUser[ProphecyType.HEART].value * 0.3 +
        calcSubj[ProphecyType.HEART].value * 0.3;

    /// it creates conflicts (throat chakra)
    result -= calcUser[ProphecyType.THROAT].value * 0.11 +
        calcSubj[ProphecyType.THROAT].value * 0.11;

    /// gender-based compatibility
    /// (solar and sacral chakras)

    /// for male chakras
    if (user.model.sex == 1) {
      result += calcUser[ProphecyType.SOLAR].value * 0.14;
      if (subject.model.sex != 1) {
        /// with female
        result -= calcSubj[ProphecyType.SOLAR].value * 0.13;

        /// sexual compatibility for today
        result += calcUser[ProphecyType.SACRAL].value * 0.11 +
            calcSubj[ProphecyType.SACRAL].value * 0.11;
      } else {
        /// with other males
        result -= calcUser[ProphecyType.SOLAR].value * 0.14;
      }
    }

    /// for female chakras
    if (user.model.sex != 1) {
      result -= calcUser[ProphecyType.SOLAR].value * 0.13;
      if (subject.model.sex == 1) {
        /// with male
        result += calcSubj[ProphecyType.SOLAR].value * 0.14;

        /// sexual compatibility for today
        result += calcUser[ProphecyType.SACRAL].value * 0.11 +
            calcSubj[ProphecyType.SACRAL].value * 0.11;
      } else {
        /// with other females
        result += calcUser[ProphecyType.SOLAR].value * 0.13;
      }
    }

    return result > 100.0
        ? 100.0
        : result < 28.0
            ? 28.0
            : result;
  }
}
