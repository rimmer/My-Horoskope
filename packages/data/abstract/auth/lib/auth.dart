library auth;

import 'package:user_model/user_model.dart';
import 'package:users/users.dart';

abstract class Auth {
  User curUser;

  Future<bool> get isAuthenticated;

  Future<User> authenticate();

  Future<bool> updateUserInformation(UserModel model);
}
