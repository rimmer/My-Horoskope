part of '../screen.dart';

extension DailyScreenPredictionMethods on _DailyScreenState {
  //
  String getPrediction({
    Map<ProphecyType, ProphecyEntity> prophecy,
    double propheciesSum,
  }) {
    final least = prophecy[prophecy.least];
    final biggest = prophecy[prophecy.biggest];

    final middle = (PROPHECY_VALUE_LIMIT_MAX + PROPHECY_VALUE_LIMIT_MIN) / 2;

    final leastImportance = middle - least.value;
    final biggestImportance = biggest.value - middle;

    /// if the least number is bigger then the middle number, give a positive prediction by biggest number prophecy
    if (leastImportance <= 0.0)
      return positivePrediction(
        type: biggest.id,
        birthDate: DateTime.fromMillisecondsSinceEpoch(
          dat.user.model.birth,
        ),
      );

    /// if the biggest number is smaller then the middle number, give a negative prediction by least number prophecy
    if (biggestImportance <= 0.0) {
      return negativePrediction(
        type: least.id,
        birthDate: DateTime.fromMillisecondsSinceEpoch(
          dat.user.model.birth,
        ),
      );
    }

    /// else, return positive prediction if sum is bigger then middle value sum and negative if lower
    if (propheciesSum < ((PROPHECY_VALUE_LIMIT_MAX / 2) * 5))
      return negativePrediction(
        type: least.id,
        birthDate: DateTime.fromMillisecondsSinceEpoch(
          dat.user.model.birth,
        ),
      );
    else
      return positivePrediction(
        type: biggest.id,
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
