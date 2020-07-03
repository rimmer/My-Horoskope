import 'dart:async';

import 'package:user_repository/src/firebase_user_repository.dart';

abstract class UserRepository {
  Future<bool> isAuthenticated();

  Future<void> authenticate();

  Future<String> getUserId();

  static createDefault() => FirebaseUserRepository();
}