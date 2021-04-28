import 'interface.dart';

class GetPredictionByDate implements GetPredictionAlgorithm {
  @override
  String prediction(
    List<String> predictions,
    dynamic data,
  ) {
    //

    if (predictions.isEmpty) {
      // throw ("Predictions were not loaded or not correct.");
      return "There is no predictions";
    }

    final birthdate = data as DateTime;
    final dateNow = DateTime.now();

    final diff = dateNow.difference(birthdate).inDays;
    final length = predictions.length - 1;

    final index = diff % length;
    return predictions[index];
  }
}
