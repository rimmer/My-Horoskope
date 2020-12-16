import '../interface.dart';

abstract class DataStrategy {
  Future jobAsync(IPredictions predictions, dynamic rawData) async {}
  void jobSync(IPredictions predictions, dynamic rawData) {}
}
