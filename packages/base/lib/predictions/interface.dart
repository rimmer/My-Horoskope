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

  GetPredictionAlgorithm get getPredictionAlgorithm;
  //

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveLuck(dynamic data) => getPredictionAlgorithm
      .prediction(positiveLuck.toList(growable: false), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveInternalStr(dynamic data) => getPredictionAlgorithm
      .prediction(positiveInternalStr.toList(growable: false), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveMoodlet(dynamic data) => getPredictionAlgorithm
      .prediction(positiveMoodlet.toList(growable: false), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveAmbition(dynamic data) => getPredictionAlgorithm
      .prediction(positiveAmbition.toList(growable: false), data);

  /// Argument is a data needed for the algorithm
  /// to search a correct index
  /// returns correct prediction in the String format
  String predictionPositiveIntelligence(dynamic data) => getPredictionAlgorithm
      .prediction(positiveIntelligence.toList(growable: false), data);

  //
  /// allows change this object in multiple ways
  /// make it very extensive and modification-ready
  /// just add anyting you need with a String label
  /// and then use this label in the job method
  Map<String, DataStrategy> get dataManipulation;

  Future jobAsync(String dataStrategyLabel, dynamic rawData) async {
    if (dataManipulation[dataStrategyLabel] != null)
      await dataManipulation[dataStrategyLabel].jobAsync(this, rawData);
  }

  void jobSync(String dataStrategyLabel, dynamic rawData) {
    if (dataManipulation[dataStrategyLabel] != null)
      dataManipulation[dataStrategyLabel].jobSync(this, rawData);
  }
}
