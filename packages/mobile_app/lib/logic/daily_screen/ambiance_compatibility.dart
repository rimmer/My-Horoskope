import 'package:base/int_datetime.dart';
import 'package:flutter/widgets.dart';
import 'package:my_horoskope/app_global.dart';

class _AmbianceCompatibility {
  _AmbianceCompatibility({
    @required this.forUser,
  });
  final UserEntity forUser;
  Map<UserEntity, double> compatibilityCache = {};

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

class AmbianceCompatibility extends InheritedWidget {
  AmbianceCompatibility({
    @required UserEntity forUser,
    @required Widget child,
  })  : _bound = _AmbianceCompatibility(forUser: forUser),
        super(child: child);

  final _AmbianceCompatibility _bound;

  static _AmbianceCompatibility of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<AmbianceCompatibility>())._bound;

  @override
  bool updateShouldNotify(AmbianceCompatibility old) => false;
}
