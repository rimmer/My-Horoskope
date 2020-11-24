import 'get_element_algo/interface.dart';

abstract class IPredictions {
  //

  Set<String> get positiveLuck;
  Set<String> get positiveInternalStr;
  Set<String> get positiveMoodlet;
  Set<String> get positiveAmbition;
  Set<String> get positiveIntelligence;

  Set<String> get negativeLuck;
  Set<String> get negativeInternalStr;
  Set<String> get negativeMoodlet;
  Set<String> get negativeAmbition;
  Set<String> get negativeIntelligence;

  IGetPredictionAlgorithm getPredictAlgo;
  //

  String predictionPositiveLuck(DateTime date) =>
      getPredictAlgo.prediction(positiveLuck.toList(), date);

  String predictionPositiveInternalStr(DateTime date) =>
      getPredictAlgo.prediction(positiveInternalStr.toList(), date);

  String predictionPositiveMoodlet(DateTime date) =>
      getPredictAlgo.prediction(positiveMoodlet.toList(), date);

  String predictionPositiveAmbition(DateTime date) =>
      getPredictAlgo.prediction(positiveAmbition.toList(), date);

  String predictionPositiveIntelligence(DateTime date) =>
      getPredictAlgo.prediction(positiveIntelligence.toList(), date);

  //

  String predictionNegativeLuck(DateTime date) =>
      getPredictAlgo.prediction(negativeLuck.toList(), date);

  String predictionNegativeInternalStr(DateTime date) =>
      getPredictAlgo.prediction(negativeInternalStr.toList(), date);

  String predictionNegativeMoodlet(DateTime date) =>
      getPredictAlgo.prediction(negativeMoodlet.toList(), date);

  String predictionNegativeAmbition(DateTime date) =>
      getPredictAlgo.prediction(negativeAmbition.toList(), date);

  String predictionNegativeIntelligence(DateTime date) =>
      getPredictAlgo.prediction(negativeIntelligence.toList(), date);

  //

}
