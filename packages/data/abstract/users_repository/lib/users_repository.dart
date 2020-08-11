library users_repository;

import 'package:meta/meta.dart';

import 'src/user.dart';
export 'src/user.dart';

/// user entities data controller
/// uses repository pattern

abstract class UsersRepository {
  /// @IMPORTANT @ESSENTIAL
  /// must be true BEFORE using repository in apps
  ///
  /// must load users list from storage
  /// and choose logged user if it exist
  /// BEFORE app would use this repository
  Future<bool> prepare();

//-----------------------------------------------------------
  /// must be true when saving changes to repository
  Future<bool> write();

  add(UserEntity user);

  delete(UserEntity user);

  List<UserEntity> get users;

  /// returns user by its id
  UserEntity get(int id);

  /// must return UserEntity with lastLogin == true
  /// but this logic can be overrided in the future
  UserEntity get current;

  /// changes boolean lastLogin of any loaded user to false
  void logoutIfAny();

  /// if user that wants to register already exist in base,
  /// load him as current and give true to bolean lastLogin
  UserEntity loginIfAny(int id);

  /// switches boolean pollAvailability if no value given
  /// and set boolean to given value otherwise
  void pollAvailabilitySwitcher({bool value});

  /// switches boolean pollStudying if no value given
  /// and set boolean to given value otherwise
  void pollStudyingSwitcher({bool value});

  /// sets two boolean values at once:
  /// - pollAvailability
  /// - pollStudying
  void pollSettingsSetter(
      {@required bool availability, @required bool studying});
}
