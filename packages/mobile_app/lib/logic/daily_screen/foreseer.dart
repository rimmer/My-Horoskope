import 'package:base/int_datetime.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:base/user/entity/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_horoskope/app_global.dart';

class _Foreseer {
  _Foreseer({
    @required this.forUser,
  });
  final UserEntity forUser;
  bool isDebug = !kReleaseMode;
  Map<UserEntity, double> compatibilityCache = {};

  Map<ProphecyType, ProphecyEntity> calculateProphecy({@required int dt}) {
    return AppGlobal.prophecyUtil.calculate(dt: dt, isDebug: AppGlobal.debug.isDebug, user: forUser);
  }

  double getCompatibilityWith(UserEntity subject) {
    if (compatibilityCache[subject] == null) {
      compatibilityCache[subject] = AppGlobal.prophecyUtil.compatibility(
        dt: dtDay,
        user: forUser,
        subject: subject,
      );
    }
    return compatibilityCache[subject];
  }
}

class Foreseer extends InheritedWidget {
  Foreseer({
    @required UserEntity forUser,
    @required Widget child,
  })  : _bound = _Foreseer(forUser: forUser),
        super(child: child);

  final _Foreseer _bound;

  static _Foreseer of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<Foreseer>())._bound;

  @override
  bool updateShouldNotify(Foreseer old) => false;
}