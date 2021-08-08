import 'package:meta/meta.dart';
import 'package:base/algorithm_interface.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:base/user/repository/interface.dart';

/// implementations
import 'implementations/numerologic_tarrot/algorithm.dart';

class Algorithm extends AlgorithmInterface {
  // singleton
  Algorithm._();
  static Algorithm _algorithm;
  factory Algorithm() {
    if (_algorithm == null) _algorithm = Algorithm._();
    return _algorithm;
  }

  /// strategy pattern, but you can save functions as variables in Dart
  Map<ProphecyType, ProphecyEntity> // return type
          Function({UserEntity aboutUser, int inTimeOf, bool isDebug})
      askProphet =

      /// implementation that used
      numerologicAndTarrotProphet;

  Map<ProphecyType, ProphecyEntity> ask(
      {@required int aboutDay,
      bool isDebug = false,
      @required UserEntity user}) {
    return askProphet(
      aboutUser: user,
      inTimeOf: aboutDay,
      isDebug: isDebug,
    );
  }
}
