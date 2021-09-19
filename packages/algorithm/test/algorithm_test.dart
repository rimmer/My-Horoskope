import 'package:base/prophecy/entity/prophecy.dart';
import 'package:base/user/entity/user.dart';
import 'package:algorithm/algorithm.dart';
import 'package:test/test.dart';

main() {
  final vsevolod = UserEntity(
    role: "user",
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

  final algorithm = Algorithm();

  test('Check if values correct for 18.3.2021', () {
    final result = algorithm.ask(
      aboutDay: DateTime(
        2021,
        3,
        18,
      ).millisecondsSinceEpoch,
      user: vsevolod,
      isDebug: true,
    );

    expect(result[ProphecyType.ROOT].value, 50.0);
    expect(result[ProphecyType.SACRAL].value, 70.0);
    expect(result[ProphecyType.SOLAR].value, 59.0);
    expect(result[ProphecyType.HEART].value, 61.0);
    expect(result[ProphecyType.THROAT].value, 65.0);
  });
}
