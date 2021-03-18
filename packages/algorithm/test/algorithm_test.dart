import 'package:my_prophet/prophecy/entity/prophecy.dart';
import 'package:my_prophet/user/entity/user.dart';
import 'package:my_prophet/user/repository/flutter_default/flutter_default.dart';
import 'package:algorithm/algorithm.dart';
import 'package:test/test.dart';

main() {
  final vsevolod = UserEntity(
    role: UserRole.USER,
    model: UserModel(
      sex: 2,
      name: "Vsevolod",
      birth: DateTime(
        1997,
        1,
        14,
      ).millisecondsSinceEpoch,
    ),
  );

  final algorithm = Algorithm(
    dat: AlgoData(
      usersRepository: UsersRepositoryFlutter(),
    ),
  );

  test('Check if values correct for 18.3.2021', () {
    final result = algorithm.ask(
      aboutDay: DateTime(
        2021,
        3,
        18,
      ).millisecondsSinceEpoch,
      testUser: vsevolod,
      isDebug: true,
    );

    expect(result[ProphecyType.INTERNAL_STRENGTH].value, 61.0);
    expect(result[ProphecyType.MOODLET].value, 50.0);
    expect(result[ProphecyType.AMBITION].value, 59.0);
    expect(result[ProphecyType.INTUITION].value, 65.0);
    expect(result[ProphecyType.LUCK].value, 70.0);
  });
}
