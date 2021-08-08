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
    @required UserModel subjectModel,
    @required String subjectRole,
  }) {
    final subject = user.ambiance.firstWhere((subject) =>
        subject.model == subjectModel && subject.role == subject.role);

    final calculationForUser = this.calculate(dt: dt, user: user);
    final calculationForSubject = this.calculate(dt: dt, user: subject);

    // @TODO

    return 80.0;
  }
}
