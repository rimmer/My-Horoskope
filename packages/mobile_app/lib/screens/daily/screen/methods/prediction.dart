part of '../screen.dart';

const _isPositive = 57.0;

extension DailyScreenPredictionMethods on _DailyScreenState {
  //
  String getPrediction({@required ProphecyType type}) {
    if (StaticProvider.prophecyBloc.currentState.prophecy[type].value >
        _isPositive)
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
      case ProphecyType.AMBITION:
        positivePredictionText = //
            StaticProvider.data.predictions.predictionPositiveAmbition(
          birthDate,
        );
        break;
      case ProphecyType.INTUITION:
        positivePredictionText =
            //
            StaticProvider.data.predictions.predictionPositiveIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.LUCK:
        positivePredictionText = //
            StaticProvider.data.predictions.predictionPositiveLuck(
          birthDate,
        );
        break;
      case ProphecyType.MOODLET:
        positivePredictionText = //
            StaticProvider.data.predictions.predictionPositiveMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.INTERNAL_STRENGTH:
      default:
        positivePredictionText =
            //
            StaticProvider.data.predictions.predictionPositiveInternalStr(
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
      case ProphecyType.AMBITION:
        negativePredictionText = //
            StaticProvider.data.predictions.predictionNegativeAmbition(
          birthDate,
        );
        break;
      case ProphecyType.INTUITION:
        negativePredictionText =
            //
            StaticProvider.data.predictions.predictionNegativeIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.LUCK:
        negativePredictionText = //
            StaticProvider.data.predictions.predictionNegativeLuck(
          birthDate,
        );
        break;
      case ProphecyType.MOODLET:
        negativePredictionText = //
            StaticProvider.data.predictions.predictionNegativeMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.INTERNAL_STRENGTH:
      default:
        negativePredictionText =
            //
            StaticProvider.data.predictions.predictionNegativeInternalStr(
          birthDate,
        );
        break;
    }

    return negativePredictionText;
  }
}
