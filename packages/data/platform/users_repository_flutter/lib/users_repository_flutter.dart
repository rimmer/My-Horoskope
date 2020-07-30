library users_repository_flutter;

import 'package:meta/meta.dart';

import 'src/storage_json.dart';
import 'package:users_repository/users_repository.dart';

class UsersRepositoryFlutter implements UsersRepository {
  UsersRepositoryStorageJson _storage = UsersRepositoryStorageJson();

  @override
  add(UserEntity user) => _storage.add(user);

  @override
  delete(UserEntity user) => _storage.delete(user);

  @override
  List<UserEntity> get users => _storage.users;

  @override
  UserEntity get(int id) => _storage.get(id);

  @override
  UserEntity get current => _storage.current;

  @override
  void logoutIfAny() => _storage.logoutIfAny();

  @override
  UserEntity loginIfAny(int id) => _storage.loginIfAny(id);

  @override
  Future<bool> write() async => await _storage.write();

  @override
  Future<bool> prepare() async => await _storage.prepare();

  @override
  void pollAvailabilitySwitcher({bool value}) {
    _storage.pollAvailabilitySwitcher(value: value);
    _storage.write();
  }

  @override
  void pollStudyingSwitcher({bool value}) {
    _storage.pollStudyingSwitcher(value: value);
    _storage.write();
  }

  @override
  void pollSettingsSetter(
      {@required bool availability, @required bool studying}) {
    _storage.pollSettingsSetter(availability: availability, studying: studying);
    _storage.write();
  }
}
