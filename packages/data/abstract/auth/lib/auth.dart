library auth;

import 'package:user_model/user_model.dart';
import 'package:users_repository/users_repository.dart';

/// interface that used by BLoC to control user authentication.

abstract class Auth {
  /// current authenticated UserEntity
  UserEntity curUser;

  /// repository of users
  UsersRepository get repository;

  /// used to check if registration or login completed by BLoC
  Future<bool> get isAuthenticated;

  /// initialization events on users_repository
  /// must be used on app start
  Future<UserEntity> get initialize;

  /// authentication methods on users_repository
  /// must be used when user registered/changed
  /// input model is a user information
  /// that will be used to calcualte the id
  Future<UserEntity> authenticate(
    UserModel model, {
    bool internalStrIsEnabled = true,
    bool moodletIsEnabled = true,
    bool ambitionIsEnabled = true,
    bool intelligenceIsEnabled = true,
    bool luckIsEnabled = true,
  });
}
