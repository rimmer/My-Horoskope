library auth_flutter;

import 'dart:async';
import 'package:auth/auth.dart';
import 'package:meta/meta.dart';
import 'package:user_model/user_model.dart';
import 'package:users_repository/users_repository.dart';
import 'package:users_repository_flutter/users_repository_flutter.dart';

class AuthFlutter implements Auth {
  final UsersRepositoryFlutter repository;
  AuthFlutter({@required this.repository});

  Future<bool> prepare() async => await repository.prepare();
  UserEntity curUser;

  @override
  Future<bool> get isAuthenticated async {
    if (curUser == null) return false;
    return true;
  }

  @override
  Future<UserEntity> get initialize async {
    bool done = await this.prepare();
    if (done == false) return null;

    final current = repository.current;

    if (current != null) curUser = current;
    return current;
  }

  @override
  Future<UserEntity> authenticate(UserModel model) async {
    repository.logoutIfAny();

    curUser = repository.loginIfAny(model.hashCode);
    if (curUser == null) {
      // if user not found in repository, create it
      curUser = UserEntity(
        model: model,
        lastLogin: true,
        role: UserRole.USER,
      );
      // add it
      repository.add(curUser);
    }

    return curUser;
  }
}
