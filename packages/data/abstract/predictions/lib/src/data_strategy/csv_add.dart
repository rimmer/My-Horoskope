import '../interface.dart';
import 'interface.dart';

/// rows of positive predictions must be divided
/// from negative predictions by an empty row ",,,,,"
/// 1 column: Luck
/// 2 column: Internal Strength
/// 3 column: Moodlet
/// 4 column: Ambition
/// 5 column: Intelligence
class SingleCsvAdd implements DataStrategy {
  Future job(IPredictions predictions, dynamic rawData) async {
    //

    final records = (rawData as String).split("\n");

    /// makes first record empty
    records[0] = "";

    List<String> field;
    bool positive = true;
    for (var record in records) {
      //

      if (record.isEmpty) continue;
      field = record.split(',');
      if (field.every((_) => _.isEmpty)) {
        positive = false;
        continue;
      }
      //

      if (positive == true) {
        predictions.positiveLuck.add(field[0]);
        predictions.positiveInternalStr.add(field[1]);
        predictions.positiveMoodlet.add(field[2]);
        predictions.positiveAmbition.add(field[3]);
        predictions.positiveIntelligence.add(field[4]);
      }

      //

      if (positive == false) {
        predictions.negativeLuck.add(field[0]);
        predictions.negativeInternalStr.add(field[1]);
        predictions.negativeMoodlet.add(field[2]);
        predictions.negativeAmbition.add(field[3]);
        predictions.negativeIntelligence.add(field[4]);
      }
    }
  }
}
