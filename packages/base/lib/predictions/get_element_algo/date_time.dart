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

    DateTime birthDate;
    DateTime dateNow;

    if (data is DateTime) {
      birthDate = data;
      dateNow = DateTime.now();
    } else if (data is Map<String, DateTime>) {
      birthDate = data['birthDate'];
      dateNow = data['dateNow'];
    }

    final diff = dateNow.difference(birthDate).inDays;
    final length = predictions.length - 1;

    final index = diff % length;
    return predictions[index];
  }
}
