import '../interface.dart';
import 'interface.dart';

/// rows of positive predictions must be divided
/// from negative predictions by an empty row ",,,,,"
/// 1 column: Luck
/// 2 column: Internal Strength
/// 3 column: Moodlet
/// 4 column: Ambition
/// 5 column: Intelligence
class SingleCsvAdd extends DataStrategy {
  Future jobSync(IPredictions predictions, dynamic rawData) {
    //

    final records = (rawData as String).split('\r\n');

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
        if (field[0].isNotEmpty) predictions.positiveLuck.add(field[0]);
        if (field[1].isNotEmpty) predictions.positiveInternalStr.add(field[1]);
        if (field[2].isNotEmpty) predictions.positiveMoodlet.add(field[2]);
        if (field[3].isNotEmpty) predictions.positiveAmbition.add(field[3]);
        if (field[4].isNotEmpty) predictions.positiveIntelligence.add(field[4]);
      } else if (positive == false) {
        if (field[0].isNotEmpty) predictions.negativeLuck.add(field[0]);
        if (field[1].isNotEmpty) predictions.negativeInternalStr.add(field[1]);
        if (field[2].isNotEmpty) predictions.negativeMoodlet.add(field[2]);
        if (field[3].isNotEmpty) predictions.negativeAmbition.add(field[3]);
        if (field[4].isNotEmpty) predictions.negativeIntelligence.add(field[4]);
      }
    }
  }
}
