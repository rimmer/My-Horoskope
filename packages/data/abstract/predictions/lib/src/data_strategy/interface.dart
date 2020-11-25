import '../interface.dart';

abstract class DataStrategy {
  Future job(IPredictions predictions, dynamic rawData);
}
