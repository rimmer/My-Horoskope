library auth;

import 'package:user_model/user_model.dart';
import 'package:users_repository/users_repository.dart';

abstract class Auth {
  UserEntity curUser;

  Future<bool> get isAuthenticated;

  Future<UserEntity> get initialize;
  Future<UserEntity> authenticate(UserModel mode);
}
