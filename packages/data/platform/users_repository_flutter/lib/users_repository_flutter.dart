library users_repository_flutter;

import 'package:meta/meta.dart';

import 'src/storage_json.dart';
import 'package:users_repository/users_repository.dart';

/// Implements users_repository for flutter

class UsersRepositoryFlutter implements UsersRepository {
  /// what implementation to use
  /// can be changed here
  UsersRepository _impl = UsersRepositoryStorageJson();

  @override
  add(UserEntity user) => _impl.add(user);

  @override
  delete(UserEntity user) => _impl.delete(user);

  @override
  List<UserEntity> get users => _impl.users;

  @override
  UserEntity get(int id) => _impl.get(id);

  @override
  UserEntity get current => _impl.current;

  @override
  void logoutIfAny() => _impl.logoutIfAny();

  @override
  UserEntity loginIfAny(int id) => _impl.loginIfAny(id);

  @override
  Future<bool> write() async => await _impl.write();

  @override
  Future<bool> prepare() async => await _impl.prepare();

  @override
  void pollAvailabilitySwitcher({bool value}) {
    _impl.pollAvailabilitySwitcher(value: value);
    _impl.write();
  }

  @override
  void pollStudyingSwitcher({bool value}) {
    _impl.pollStudyingSwitcher(value: value);
    _impl.write();
  }

  @override
  void pollSettingsSetter(
      {@required bool availability, @required bool studying}) {
    _impl.pollSettingsSetter(availability: availability, studying: studying);
    _impl.write();
  }
}
