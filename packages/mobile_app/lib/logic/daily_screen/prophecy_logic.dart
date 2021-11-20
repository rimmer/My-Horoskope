import 'package:base/int_datetime.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:base/user/entity/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_horoskope/app_global.dart';

class _ProphecyLogic extends ChangeNotifier {
  _ProphecyLogic({
    @required this.forUser,
  });
  final UserEntity forUser;
  bool isDebug = !kReleaseMode;

  Map<ProphecyType, ProphecyEntity> get currentProphecy {
    if (AppGlobal.prophecyUtil.current == null) {
      this.calculateProphecy(dt: dtNow);
    }
    return AppGlobal.prophecyUtil.current;
  }

  void calculateProphecy({@required int dt}) =>
      AppGlobal.prophecyUtil.calculate(dt: dt, isDebug: AppGlobal.debug.isDebug, user: forUser);

  double getCompatibilityWith({@required UserEntity subject}) => AppGlobal.prophecyUtil.compatibility(
        dt: dtNow,
        user: forUser,
        subject: subject,
      );
}

class ProphecyLogic extends InheritedWidget {
  ProphecyLogic({@required UserEntity forUser}) : _bound = _ProphecyLogic(forUser: forUser);

  final _ProphecyLogic _bound;

  static _ProphecyLogic of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<ProphecyLogic>())._bound;

  @override
  bool updateShouldNotify(ProphecyLogic old) => false;
}
