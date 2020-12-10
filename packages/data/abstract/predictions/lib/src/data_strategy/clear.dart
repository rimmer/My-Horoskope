import '../interface.dart';
import 'interface.dart';

class Clear extends DataStrategy {
  Future jobSync(IPredictions predictions, dynamic data) async {
    //

    predictions.positiveLuck.clear();
    predictions.positiveInternalStr.clear();
    predictions.positiveMoodlet.clear();
    predictions.positiveAmbition.clear();
    predictions.positiveIntelligence.clear();

    predictions.negativeLuck.clear();
    predictions.negativeInternalStr.clear();
    predictions.negativeMoodlet.clear();
    predictions.negativeAmbition.clear();
    predictions.negativeIntelligence.clear();
  }
}
