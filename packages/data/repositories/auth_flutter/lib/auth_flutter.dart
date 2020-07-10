library auth_flutter;

import 'dart:async';
import 'package:auth/auth.dart';
import 'package:user_model/user_model.dart';
import 'package:users/users.dart';

class AuthFlutter implements Auth {
  User curUser;

  Future<bool> get isAuthenticated async => false;

  Future<User> authenticate() async => null;

  Future<bool> updateUserInformation(UserModel model) async => true;
}
