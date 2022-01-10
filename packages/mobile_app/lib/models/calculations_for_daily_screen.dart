import 'package:base/prophecy/entity/prophecy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class _CalculationsForDailySreen {
  _CalculationsForDailySreen({
    @required this.prophecy,
    @required this.isNotToday,
    @required this.dt,
  });
  final Map<ProphecyType, ProphecyEntity> prophecy;
  final bool isNotToday;
  final int dt;
}

class CalculationsForDailySreen extends InheritedWidget {
  CalculationsForDailySreen({
    @required Widget child,
    @required Map<ProphecyType, ProphecyEntity> prophecy,
    @required bool isNotToday,
    @required int dt,
  })  : _bound = _CalculationsForDailySreen(
          prophecy: prophecy,
          isNotToday: isNotToday,
          dt: dt,
        ),
        super(child: child);

  final _CalculationsForDailySreen _bound;

  static _CalculationsForDailySreen of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<CalculationsForDailySreen>())
          ._bound;

  @override
  bool updateShouldNotify(CalculationsForDailySreen old) => true;
}
