part of '../daily_screen.dart';

const _isPositive = 57.0;

extension DailyScreenPredictionMethods on _DailyScreenState {
  String getPrediction() {
    final propheciesSum = AppGlobal.prophecyUtil.current.sum;
    final prophecies = AppGlobal.prophecyUtil.current;
    ProphecyType type;
    String result;

    if (propheciesSum >= 300.0) {
      type = prophecies.biggest;
      result = getPredictionByType(type: type);
    } else {
      type = prophecies.least;
      result = getPredictionByType(type: type);
    }

    return result;
  }

  //
  String getPredictionByType({@required ProphecyType type}) {
    if (AppGlobal.prophecyUtil.current[type].value > _isPositive)
      return positivePrediction(
        type: type,
        birthDate: DateTime.fromMillisecondsSinceEpoch(
          dat.user.model.birth,
        ),
      );
    else
      return negativePrediction(
        type: type,
        birthDate: DateTime.fromMillisecondsSinceEpoch(
          dat.user.model.birth,
        ),
      );
  }

  String positivePrediction(
      {@required ProphecyType type, @required DateTime birthDate}) {
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

  String negativePrediction(
      {@required ProphecyType type, @required DateTime birthDate}) {
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
}
