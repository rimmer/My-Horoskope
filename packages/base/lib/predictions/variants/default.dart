import '../get_element_algo/interface.dart';
import '../data_strategy/interface.dart';
import '../interface.dart';

class DefaultPredictions extends IPredictions {
  //

  /// you cant change them directly,
  /// you can only add or remove items from it,
  /// so they must be private final
  final _dataManipulation = Map<String, DataStrategy>();

  final _positiveLuck = Set<String>();
  final _positiveInternalStr = Set<String>();
  final _positiveMoodlet = Set<String>();
  final _positiveAmbition = Set<String>();
  final _positiveIntelligence = Set<String>();

  final _negativeLuck = Set<String>();
  final _negativeInternalStr = Set<String>();
  final _negativeMoodlet = Set<String>();
  final _negativeAmbition = Set<String>();
  final _negativeIntelligence = Set<String>();

  /// public getters of it
  Map<String, DataStrategy> get dataManipulation => _dataManipulation;

  Set<String> get positiveLuck => _positiveLuck;
  Set<String> get positiveInternalStr => _positiveInternalStr;
  Set<String> get positiveMoodlet => _positiveMoodlet;
  Set<String> get positiveAmbition => _positiveAmbition;
  Set<String> get positiveIntelligence => _positiveIntelligence;

  Set<String> get negativeLuck => _negativeLuck;
  Set<String> get negativeInternalStr => _negativeInternalStr;
  Set<String> get negativeMoodlet => _negativeMoodlet;
  Set<String> get negativeAmbition => _negativeAmbition;
  Set<String> get negativeIntelligence => _negativeIntelligence;

  /// you can change the algorithm, so it is a variable
  GetPredictionAlgorithm getPredictionAlgorithm;
}
