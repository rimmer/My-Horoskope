import 'dart:async';

import 'dummy_user_repository.dart';

abstract class UserRepository {
  Future<bool> isAuthenticated();

  Future<void> authenticate();

  Future<String> getUserId();

  static createDefault() => DumyUserRepository();
}
