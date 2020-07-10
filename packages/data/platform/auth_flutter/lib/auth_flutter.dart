library auth_flutter;

import 'dart:async';
import 'package:auth/auth.dart';
import 'package:meta/meta.dart';
import 'package:user_model/user_model.dart';
import 'package:users/users.dart';
import 'package:users_flutter/users_flutter.dart';

class AuthFlutter implements Auth {
  final UsersStorageJson storage;
  AuthFlutter({@required this.storage});

  Future<bool> prepare() async => await storage.prepare();
  User curUser;

  @override
  Future<bool> get isAuthenticated async {
    if (curUser == null) return false;
    return true;
  }

  @override
  Future<User> get initialize async {
    bool done = await this.prepare();
    if (done == false) return null;

    final current = storage.current;

    if (current != null) curUser = current;
    return current;
  }

  @override
  Future<User> authenticate(UserModel model) async {
    storage.logoutIfAny();

    curUser = storage.loginIfAny(model.hashCode);
    if (curUser == null) {
      // if user not found in storage, create it
      curUser = User(
        model: model,
        lastLogin: true,
        role: UserRole.USER,
      );
      // add it
      storage.add(curUser);
    }

    return curUser;
  }
}
