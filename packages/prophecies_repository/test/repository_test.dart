import 'package:flutter_test/flutter_test.dart';
import 'package:prophecies_repository/src/entities/entities.dart';

void main() {
  test('Test entities toJson conversion', () {
    final prophecy = ProphecyEntity(name: "Health", value: 10.0);
    expect(prophecy.toJson().toString(),
        '{id: null, name: Health, value: 10.0}');
  });
}
