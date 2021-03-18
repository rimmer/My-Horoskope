import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// user model stores basic user information like a name and birthdate
@JsonSerializable()
class UserModel {
  final String name;

  /// birth date in milliseconds since epoch
  final int birth;

  /// sex:
  /// 0 - not selected
  /// 1 - male
  /// 2 - female
  /// 3 - other
  final int sex;

  UserModel({
    @required this.name,
    @required this.birth,
    @required this.sex,
  });

  Map<String, Object> toJson() => _$UserModelToJson(this);

  static UserModel fromJson(Map<String, Object> json) =>
      _$UserModelFromJson(json);
}

/// more rolls will be added
enum UserRole {
  NONE,
  USER,
  FRIEND,
  COWORKER,
  MANAGER,
  SUBORDINATE,
  BOYFRIEND,
  GIRLFRIEND,
  LOVER,
  HUSBAND,
  WIFE,
  SON,
  DAUGHTER,
  FAMILY,
  PET,
  GUARDIAN,
}

@JsonSerializable()
class UserEntity {
  /// unique user id
  final int id;
  UserRole role;

  /// model is immutable and
  /// must be recreated every time it changed
  /// (makes it failproof)
  UserModel model;

  /// other peoples in user' life that
  /// magically impact his life
  /// and important enough to be added
  List<UserEntity> ambiance;

  /// used to check what user was logged in previous session
  bool lastLogin;

  UserEntity({
    id,
    this.role = UserRole.USER,
    this.ambiance = const [],
    this.lastLogin = false,
    @required this.model,
  }) : this.id = id ?? model.birth;

  Map<String, Object> toJson() => _$UserEntityToJson(this);

  static UserEntity fromJson(Map<String, Object> json) =>
      _$UserEntityFromJson(json);

  @override
  String toString() {
    /// will give json representation of entity
    return json.encode(this.toJson());
  }
}