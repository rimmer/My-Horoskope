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
      field = record.splitCsvRow();

      if (field.every((_) => _.isEmpty)) {
        positive = false;
        continue;
      }
      //

      if (positive == true) {
        if (field[0] != null && field[0].isNotEmpty)
          predictions.positiveLuck.add(field[0]);
        if (field[1] != null && field[1].isNotEmpty)
          predictions.positiveInternalStr.add(field[1]);
        if (field[2] != null && field[2].isNotEmpty)
          predictions.positiveMoodlet.add(field[2]);
        if (field[3] != null && field[3].isNotEmpty)
          predictions.positiveAmbition.add(field[3]);
        if (field[4] != null && field[4].isNotEmpty)
          predictions.positiveIntelligence.add(field[4]);
      } else if (positive == false) {
        if (field[0] != null && field[0].isNotEmpty)
          predictions.negativeLuck.add(field[0]);
        if (field[1] != null && field[1].isNotEmpty)
          predictions.negativeInternalStr.add(field[1]);
        if (field[2] != null && field[2].isNotEmpty)
          predictions.negativeMoodlet.add(field[2]);
        if (field[3] != null && field[3].isNotEmpty)
          predictions.negativeAmbition.add(field[3]);
        if (field[4] != null && field[4].isNotEmpty)
          predictions.negativeIntelligence.add(field[4]);
      }
    }
  }
}

extension CsvMethods on String {
  List<String> splitCsvRow() {
    final lst = List<String>();
    var csvRow = this;

    while (csvRow.isNotEmpty) {
      /// first we check if first column has "," inside of it
      /// in this case, this column will be inside of ""
      if (csvRow.startsWith('"') && !csvRow.startsWith('""') ||
          csvRow.startsWith('"""')) {
        /// find position where column ends
        final end = csvRow.indexOf('",');

        /// if no position found, it is the last column in the row
        if (end == -1) {
          lst.add(
              (csvRow.substring(1, csvRow.length - 1)).replaceAll('""', '"'));
          csvRow = "";
        } else {
          /// if it found, add it to a list and
          /// cut the csvRow to substring without it
          lst.add((csvRow.substring(1, end)).replaceAll('""', '"'));
          csvRow = csvRow.substring(end + 2, csvRow.length);
        }
      }

      /// if first column is empty
      /// skip it
      else if (csvRow.startsWith(',')) {
        lst.add("");
        if (csvRow.length == 1)
          csvRow = "";
        else
          csvRow = csvRow.substring(1, csvRow.length);
      }

      /// if first column has no ","
      else {
        final end = csvRow.indexOf(',');

        /// if no position found, it is the last column in the row
        if (end == -1) {
          lst.add((csvRow.substring(0, csvRow.length)).replaceAll('""', '"'));
          csvRow = "";
        } else {
          /// if it found, add it to a list and
          /// cut the csvRow to substring without it
          lst.add((csvRow.substring(0, end)).replaceAll('""', '"'));
          csvRow = csvRow.substring(
              end + (csvRow.endsWith(',') ? 0 : 1), csvRow.length);
        }
      }

      /// continue till csvRow is not empty
    }

    return lst;
  }
}
