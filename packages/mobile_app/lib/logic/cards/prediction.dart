import 'package:base/preferences/setting/enabled_prophecies/item.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:flutter/widgets.dart';

class _Prediction {
  _Prediction({
    @required this.toShow,
    @required this.birthDate,
    @required this.predictionTextCallback,
  });
  final EnabledProphecies toShow;
  final DateTime birthDate;
  final String Function({@required ProphecyType type, @required DateTime birthDate}) predictionTextCallback;

  String prediction({@required ProphecyType type}) => predictionTextCallback(
        type: type,
        birthDate: birthDate,
      );
}

class Prediction extends InheritedWidget {
  Prediction({
    @required Widget child,
    @required EnabledProphecies toShow,
    @required DateTime birthDate,
    @required String Function() predictionTextCallback,
  })  : _bound = _Prediction(
          toShow: toShow,
          birthDate: birthDate,
          predictionTextCallback: predictionTextCallback,
        ),
        super(child: child);

  final _Prediction _bound;

  static _Prediction of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<Prediction>())._bound;

  @override
  bool updateShouldNotify(Prediction old) => false;
}
