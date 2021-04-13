part of '../screen.dart';

const _isPositive = 57.0;

extension DailyScreenPredictionMethods on _DailyScreenState {
  //
  String getPrediction({@required ProphecyType type}) {
    if (sp.prophecyBloc.currentState.prophecy[type].value > _isPositive)
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
            sp.predictions.predictionPositiveAmbition(
          birthDate,
        );
        break;
      case ProphecyType.INTUITION:
        positivePredictionText =
            //
            sp.predictions.predictionPositiveIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.LUCK:
        positivePredictionText = //
            sp.predictions.predictionPositiveLuck(
          birthDate,
        );
        break;
      case ProphecyType.MOODLET:
        positivePredictionText = //
            sp.predictions.predictionPositiveMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.INTERNAL_STRENGTH:
      default:
        positivePredictionText =
            //
            sp.predictions.predictionPositiveInternalStr(
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
            sp.predictions.predictionNegativeAmbition(
          birthDate,
        );
        break;
      case ProphecyType.INTUITION:
        negativePredictionText =
            //
            sp.predictions.predictionNegativeIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.LUCK:
        negativePredictionText = //
            sp.predictions.predictionNegativeLuck(
          birthDate,
        );
        break;
      case ProphecyType.MOODLET:
        negativePredictionText = //
            sp.predictions.predictionNegativeMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.INTERNAL_STRENGTH:
      default:
        negativePredictionText =
            //
            sp.predictions.predictionNegativeInternalStr(
          birthDate,
        );
        break;
    }

    return negativePredictionText;
  }
}
