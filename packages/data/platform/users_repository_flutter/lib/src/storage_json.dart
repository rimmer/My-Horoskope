import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:storage_access/storage_access.dart' as storage;
import 'package:users_repository/users_repository.dart';

part 'storage_json.g.dart';

/// Implementation of users_repository using
/// json and storage_access for flutter

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

  /// prepares repository
  /// by reading json file with all users
  /// and adding UserEntities to `this`.users
  /// if all okay
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
      ? users.firstWhere(
          (element) => element.id == id,
          orElse: () => null,
        )
      : null;

  @override
  UserEntity get current => (users.isNotEmpty)
      ? users.firstWhere(
          (element) => element.lastLogin == true,
          orElse: () => null,
        )
      : null;

  @override
  void logoutIfAny() {
    /// find user that logged in
    final toLogOut = this.current;
    if (toLogOut == null) return;

    /// make its lastLogin boolean equal false
    toLogOut.lastLogin = false;
  }

  @override
  UserEntity loginIfAny(int id) {
    /// if user already in repository,
    /// make lastLogin equal true
    /// and return him
    final user = this.get(id);
    if (user != null) {
      print("OK");
      user.lastLogin = true;
    }
    return user;
  }

  @override
  void pollAvailabilitySwitcher({bool value}) {
    /// if no user selected (registred/logged in)
    /// stop switcher from exucting
    if (current == null) return;

    /// if value provided - set it,
    /// if not provided - switch it
    if (value != null)
      current.pollAvailability = value;
    else
      current.pollAvailability = !current.pollAvailability;
  }

  @override
  void pollStudyingSwitcher({bool value}) {
    /// if no user selected (registred/logged in)
    /// stop switcher from exucting
    if (current == null) return;

    /// if value provided - set it,
    /// if not provided - switch it
    if (value != null)
      current.pollStudying = value;
    else
      current.pollStudying = !current.pollStudying;
  }

  @override
  void pollSettingsSetter(
      {@required bool availability, @required bool studying}) {
    pollAvailabilitySwitcher(value: availability);
    pollStudyingSwitcher(value: studying);
  }
}
