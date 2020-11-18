import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_model/user_model.dart';

part 'user.g.dart';

/// user entity with user model and mutable fields,
/// that is loaded and used by data controller

/// more rolls will be added
enum UserRole {
  NONE,
  USER,
  SOULMATE,
  FRIEND,
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

  /// checks if user wants to use poll system
  bool pollAvailability;
  bool pollStudying;
  bool pollsAreComplex;

  UserEntity({
    id,
    this.role = UserRole.USER,
    this.ambiance = const [],
    this.lastLogin = false,
    @required this.model,
    this.pollAvailability = true,
    this.pollStudying = false,
    this.pollsAreComplex = false,
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
