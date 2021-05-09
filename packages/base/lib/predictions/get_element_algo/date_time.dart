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

    final birthDate = data as DateTime;
    final dateNow = DateTime.now();

    final diff = dateNow.difference(birthDate).inDays;
    final length = predictions.length - 1;

    final index = diff % length;
    return predictions[index];
  }
}
