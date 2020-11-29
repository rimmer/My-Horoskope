import 'get_element_algo/interface.dart';
import 'data_strategy/interface.dart';

/// interface for loading and getting prediction Strings
/// it has 5 positive and 5 negative Sets of preditictions
/// for 5 prophecies respectively
/// it is highly extensible
/// method for getting index of needed prediction and
/// data manipulation methods are seperated objects
/// also, you can add as many data manipulation objects as you like
/// by providing a String label for every
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

  GetPredictionAlgorithm get getPredictionAlgorithm;
  //

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveLuck(dynamic data) =>
      getPredictionAlgorithm.prediction(positiveLuck.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveInternalStr(dynamic data) =>
      getPredictionAlgorithm.prediction(positiveInternalStr.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveMoodlet(dynamic data) =>
      getPredictionAlgorithm.prediction(positiveMoodlet.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveAmbition(dynamic data) =>
      getPredictionAlgorithm.prediction(positiveAmbition.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveIntelligence(dynamic data) =>
      getPredictionAlgorithm.prediction(positiveIntelligence.toList(), data);

  //

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionNegativeLuck(dynamic data) =>
      getPredictionAlgorithm.prediction(negativeLuck.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionNegativeInternalStr(dynamic data) =>
      getPredictionAlgorithm.prediction(negativeInternalStr.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionNegativeMoodlet(dynamic data) =>
      getPredictionAlgorithm.prediction(negativeMoodlet.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionNegativeAmbition(dynamic data) =>
      getPredictionAlgorithm.prediction(negativeAmbition.toList(), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionNegativeIntelligence(dynamic data) =>
      getPredictionAlgorithm.prediction(negativeIntelligence.toList(), data);

  //
  /// allows change this object in multiple ways
  /// make it very extensive and modification-ready
  /// just add anyting you need with a String label
  /// and then use this label in the job method
  Map<String, DataStrategy> get dataManipulation;

  Future job(String dataStrategyLabel, dynamic rawData) async {
    if (dataManipulation[dataStrategyLabel] != null)
      await dataManipulation[dataStrategyLabel].job(this, rawData);
  }
}
