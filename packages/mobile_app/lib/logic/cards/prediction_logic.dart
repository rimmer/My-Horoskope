import 'package:base/preferences/setting/enabled_prophecies/item.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:flutter/widgets.dart';

class _PredictionLogic extends ChangeNotifier {
  _PredictionLogic({
    @required this.toShow,
    @required this.predictionTextCallback,
  });
  final EnabledProphecies toShow;
  final String Function({@required ProphecyType type}) predictionTextCallback;
}

class PredictionLogic extends InheritedWidget {
  PredictionLogic({
    @required Widget child,
    @required EnabledProphecies toShow,
    @required String Function() predictionTextCallback,
  })  : _bound = _PredictionLogic(
          toShow: toShow,
          predictionTextCallback: predictionTextCallback,
        ),
        super(child: child);

  final _PredictionLogic _bound;

  static _PredictionLogic of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<PredictionLogic>())._bound;

  @override
  bool updateShouldNotify(PredictionLogic old) => false;
}
