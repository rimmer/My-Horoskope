import 'package:base/predictions/index.dart';
import 'package:text/text.dart';
export 'package:base/predictions/interface.dart';

class PredictionsFlutterMobile extends DefaultPredictions {
  /// constructor
  PredictionsFlutterMobile() {
    getPredictionAlgorithm = GetPredictionByDate();
    dataManipulation["add_csv"] = SingleCsvAdd();
    dataManipulation["clear"] = Clear();
  }

  Future prepare() async {
    /// Bark annalogy from the tree bark
    final predictionBark = localeText.predicitonBark();
    for (var layer in predictionBark) {
      if (layer.isEmpty) continue;
      this.jobSync("add_csv", layer);
    }
  }

  GetPredictionAlgorithm getPredictionAlgorithm;
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
}
