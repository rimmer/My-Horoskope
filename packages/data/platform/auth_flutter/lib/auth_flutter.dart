library auth_flutter;

import 'dart:async';
import 'package:auth/auth.dart';
import 'package:meta/meta.dart';
import 'package:user_model/user_model.dart';
import 'package:users_repository/users_repository.dart';
import 'package:users_repository_flutter/users_repository_flutter.dart';

class AuthFlutter implements Auth {
  /// implements Auth data controller
  /// using already implemented  users_repository
  //
  final UsersRepository repository;

  AuthFlutter({@required this.repository});

  /// prepares users_repository
  Future<bool> prepare() async => await repository.prepare();

  /// current user
  /// if equal null, then no user logged in
  UserEntity curUser;

  @override
  Future<bool> get isAuthenticated async {
    if (curUser == null) return false;
    return true;
  }

  /// must be used on app start
  /// after users_repository were prepared
  /// return current logged user from repository
  /// return null if no user logged in
  @override
  Future<UserEntity> get initialize async {
    bool done = await this.prepare();
    if (done == false) return null;

    final current = repository.current;

    if (current != null) curUser = current;
    return current;
  }

  /// if any user logged in already - log out him
  /// use id of calculated model
  /// if it already exist in repository
  /// if not, create new Entity and add it to repository
  /// change value of `this`.curUser to whatever created
  /// and return it
  ///
  /// can be null if `this`.curUser is null
  @override
  Future<UserEntity> authenticate(UserModel model) async {
    repository.logoutIfAny();

    curUser = repository.loginIfAny(model.hashCode);
    if (curUser == null) {
      /// if user not found in repository, create it
      curUser = UserEntity(
        model: model,
        lastLogin: true,
        role: UserRole.USER,
      );

      /// add it
      repository.add(curUser);
    }

    return curUser;
  }
}
