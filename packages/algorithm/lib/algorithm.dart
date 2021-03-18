import 'package:meta/meta.dart';
import 'package:my_prophet/algorithm_interface.dart';
import 'package:my_prophet/prophecy/entity/prophecy.dart';
import 'package:my_prophet/user/repository/interface.dart';

/// implementations
import 'implementations/numerologic_tarrot/algorithm.dart';

class AlgoData {
  // singleton
  AlgoData._({@required this.usersRepository});
  static AlgoData _algoData;
  factory AlgoData({@required UsersRepository usersRepository}) {
    if (_algoData == null)
      _algoData = AlgoData._(usersRepository: usersRepository);
    return _algoData;
  }

  /// repository of users which have a getter of current logged user
  UsersRepository usersRepository;

  /// current logged user
  UserEntity get user => usersRepository.current;
}

class Algorithm extends AlgorithmInterface {
  // singleton
  Algorithm._({@required this.dat});
  static Algorithm _algorithm;
  factory Algorithm({@required AlgoData dat}) {
    if (_algorithm == null) _algorithm = Algorithm._(dat: dat);
    return _algorithm;
  }

  /// strategy pattern, but you can save functions as variables in Dart
  Map<ProphecyType, ProphecyEntity> // return type
          Function({UserEntity aboutUser, int inTimeOf}) askProphet =

      /// implementation that used
      numerologicAndTarrotProphet;

  final AlgoData dat;

  Map<ProphecyType, ProphecyEntity> ask({@required int aboutDay}) {
    return askProphet(aboutUser: dat.user, inTimeOf: aboutDay);
  }
}
