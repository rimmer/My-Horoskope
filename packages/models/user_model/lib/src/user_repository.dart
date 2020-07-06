import 'dart:async';

import 'firebase_user_repository.dart';

abstract class UserRepository {
  Future<bool> isAuthenticated();

  Future<void> authenticate();

  Future<String> getUserId();

  static createDefault() => FirebaseUserRepository();
}
