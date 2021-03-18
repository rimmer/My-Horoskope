import '../flutter_storage_json/storage_json.dart';
import '../interface.dart';

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
}
