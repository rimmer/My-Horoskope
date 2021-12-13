import 'package:base/preferences/setting/enabled_prophecies/item.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:flutter/widgets.dart';
import 'package:my_horoskope/app_global.dart';

const _isPositive = 57.0;

class _Prediction {
  _Prediction({
    @required this.toShow,
    @required this.birthDate,
  });
  final EnabledProphecies toShow;
  final DateTime birthDate;

  String getPredictionByType({
    @required ProphecyType type,
    @required DateTime birthDate,
  }) {
    if (AppGlobal.prophecyUtil.current[type].value > _isPositive)
      return positivePrediction(
        type: type,
        birthDate: birthDate,
      );
    else
      return negativePrediction(
        type: type,
        birthDate: birthDate,
      );
  }

  String positivePrediction({@required ProphecyType type, @required DateTime birthDate}) {
    print("Positive prediction, ${type.toStr}\n");
    String positivePredictionText;

    switch (type) {
      case ProphecyType.SOLAR:
        positivePredictionText = //
            AppGlobal.data.predictions.predictionPositiveAmbition(
          birthDate,
        );
        break;
      case ProphecyType.THROAT:
        positivePredictionText =
            //
            AppGlobal.data.predictions.predictionPositiveIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.SACRAL:
        positivePredictionText = //
            AppGlobal.data.predictions.predictionPositiveLuck(
          birthDate,
        );
        break;
      case ProphecyType.ROOT:
        positivePredictionText = //
            AppGlobal.data.predictions.predictionPositiveMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.HEART:
      default:
        positivePredictionText =
            //
            AppGlobal.data.predictions.predictionPositiveInternalStr(
          birthDate,
        );
        break;
    }

    return positivePredictionText;
  }

  String negativePrediction({@required ProphecyType type, @required DateTime birthDate}) {
    print("Negative prediction, ${type.toStr}\n");

    String negativePredictionText;

    switch (type) {
      case ProphecyType.SOLAR:
        negativePredictionText = //
            AppGlobal.data.predictions.predictionNegativeAmbition(
          birthDate,
        );
        break;
      case ProphecyType.THROAT:
        negativePredictionText =
            //
            AppGlobal.data.predictions.predictionNegativeIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.SACRAL:
        negativePredictionText = //
            AppGlobal.data.predictions.predictionNegativeLuck(
          birthDate,
        );
        break;
      case ProphecyType.ROOT:
        negativePredictionText = //
            AppGlobal.data.predictions.predictionNegativeMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.HEART:
      default:
        negativePredictionText =
            //
            AppGlobal.data.predictions.predictionNegativeInternalStr(
          birthDate,
        );
        break;
    }

    return negativePredictionText;
  }

  String prediction({@required ProphecyType type}) => getPredictionByType(
        type: type,
        birthDate: birthDate,
      );
}

class Prediction extends InheritedWidget {
  Prediction({
    @required Widget child,
    @required EnabledProphecies toShow,
    @required DateTime birthDate,
  })  : _bound = _Prediction(
          toShow: toShow,
          birthDate: birthDate,
        ),
        super(child: child);

  final _Prediction _bound;

  static _Prediction of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<Prediction>())._bound;

  @override
  bool updateShouldNotify(Prediction old) => false;
}
