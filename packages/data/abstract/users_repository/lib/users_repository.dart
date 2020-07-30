library users_repository;

import 'package:meta/meta.dart';

import 'src/user.dart';
export 'src/user.dart';

abstract class UsersRepository {
  add(UserEntity user);

  delete(UserEntity user);

  List<UserEntity> get users;

  UserEntity get(int id);

  UserEntity get current;

  void logoutIfAny();

  UserEntity loginIfAny(int id);

  Future<bool> write();

  Future<bool> prepare();

  void pollAvailabilitySwitcher({bool value});

  void pollStudyingSwitcher({bool value});

  void pollSettingsSetter(
      {@required bool availability, @required bool studying});
}
