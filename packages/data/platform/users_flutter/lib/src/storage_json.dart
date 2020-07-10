import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:storage_access/storage_access.dart' as storage;
import 'package:users/users.dart';

part 'storage_json.g.dart';

String _storageFileName = "local_users.json";

@JsonSerializable()
class UsersStorageJson implements Users {
  List<User> users;

  UsersStorageJson({this.users = const []});

  Map<String, Object> toJson() => _$UsersStorageJsonToJson(this);

  static UsersStorageJson fromJson(Map<String, Object> json) =>
      _$UsersStorageJsonFromJson(json);

  Future<bool> write() async => storage.write(
        data: json.encode(this.toJson()),
        asFile: _storageFileName,
      );

  Future<bool> prepare() async {
    final readed = await storage.read(fromFile: _storageFileName);
    if (readed == null) return false;

    this.users = fromJson(json.decode(readed)).users;
    return true;
  }

  @override
  add(User user) {
    users.add(user);
    this.write();
  }

  @override
  delete(User user) {
    users.remove(user);
    this.write();
  }

  @override
  User get(int id) => users.firstWhere((element) => element.id == id);

  @override
  User get current => users.firstWhere((element) => element.lastLogin == true);

  @override
  void logoutIfAny() {
    final toLogOut = this.current;
    if (toLogOut == null) return;
    toLogOut.lastLogin = false;
  }

  @override
  User loginIfAny(int id) {
    final user = this.get(id);
    if (user != null) user.lastLogin = true;
    return user;
  }
}
