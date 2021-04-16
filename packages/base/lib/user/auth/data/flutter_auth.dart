import 'dart:async';
import 'package:meta/meta.dart';
import 'interface.dart';
import '../../repository/interface.dart';
import '../../repository/flutter_default/flutter_default.dart';

class AuthFlutter implements Auth {
  // singleton
  AuthFlutter._({@required this.repository});
  static AuthFlutter _authFlutter;
  factory AuthFlutter({@required UsersRepositoryFlutter repository}) {
    if (_authFlutter == null)
      _authFlutter = AuthFlutter._(repository: repository);
    return _authFlutter;
  }

  /// implements Auth data controller
  /// using already implemented  users_repository
  //
  final UsersRepositoryFlutter repository;

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

    curUser = repository.loginIfAny(model.birth);
    if (curUser == null) {
      /// if user not found in repository, create it
      curUser = UserEntity(
        model: model,
        lastLogin: true,
        role: "user",
      );

      /// add it
      repository.add(curUser);
    } else {
      curUser.model = model;
      repository.write();
    }

    return curUser;
  }
}
