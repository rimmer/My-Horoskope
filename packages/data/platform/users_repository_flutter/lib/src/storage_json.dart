import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:storage_access/storage_access.dart' as storage;
import 'package:users_repository/users_repository.dart';

part 'storage_json.g.dart';

String _storageFileName = "local_users.json";

@JsonSerializable()
class UsersRepositoryStorageJson implements UsersRepository {
  final List<UserEntity> users;

  UsersRepositoryStorageJson({List<UserEntity> users})
      : this.users = users ?? [];

  Map<String, Object> toJson() => _$UsersRepositoryStorageJsonToJson(this);

  static UsersRepositoryStorageJson fromJson(Map<String, Object> json) =>
      _$UsersRepositoryStorageJsonFromJson(json);

  @override
  Future<bool> write() async => await storage.write(
        data: json.encode(this.toJson()),
        asFile: _storageFileName,
      );

  @override
  Future<bool> prepare() async {
    try {
      final red = await storage.read(fromFile: _storageFileName);
      if (red != null) {
        final usersFromFile = fromJson(json.decode(red)).users;
        this.users.addAll(usersFromFile);
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  @override
  add(UserEntity user) {
    users.add(user);
    this.write();
  }

  @override
  delete(UserEntity user) {
    users.remove(user);
    this.write();
  }

  @override
  UserEntity get(int id) => (users.isNotEmpty)
      ? users.firstWhere((element) => element.id == id)
      : null;

  @override
  UserEntity get current => (users.isNotEmpty)
      ? users.firstWhere((element) => element.lastLogin == true)
      : null;

  @override
  void logoutIfAny() {
    final toLogOut = this.current;
    if (toLogOut == null) return;
    toLogOut.lastLogin = false;
  }

  @override
  UserEntity loginIfAny(int id) {
    final user = this.get(id);
    if (user != null) user.lastLogin = true;
    return user;
  }
}
