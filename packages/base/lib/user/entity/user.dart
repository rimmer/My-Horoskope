import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// user model stores basic user information like a name and birthdate
@JsonSerializable()
class UserModel extends Equatable {
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

  @override
  List<Object> get props => [name, birth, sex];

  Map<String, Object> toJson() => _$UserModelToJson(this);

  static UserModel fromJson(Map<String, Object> json) =>
      _$UserModelFromJson(json);
}

@JsonSerializable()
class UserEntity {
  /// unique user id
  final int id;

  /// We use String here
  /// Since user an enter any role he want
  /// Even fictional ones
  String role;

  /// model is immutable and
  /// must be recreated every time it changed
  /// (makes it failproof)
  UserModel model;

  bool isTester;

  /// other peoples in user' life that
  /// magically impact his life
  /// and important enough to be added
  List<UserEntity> ambiance;

  /// used to check what user was logged in previous session
  bool lastLogin;

  UserEntity({
    id,
    this.role = "user",
    this.ambiance = const [],
    this.lastLogin = false,
    this.isTester = false,
    @required this.model,
  }) : this.id = id ?? model.birth;

  addAmbianceSubject(UserEntity subject) {
    if (ambiance == null || ambiance.isEmpty) ambiance = [];
    if (!ambiance.contains(subject)) ambiance.add(subject);
  }

  updateAmbianceSubject(UserEntity subject, UserEntity update) {
    if (ambiance == null || ambiance.isEmpty) ambiance = [];
    if (ambiance.contains(subject)) {
      ambiance[ambiance.indexOf(subject)] = update;
    }
  }

  removeAmbianceSubject(UserEntity subject) {
    if (ambiance == null || ambiance.isEmpty) ambiance = [];
    if (ambiance.contains(subject)) ambiance.remove(subject);
  }

  @override
  bool operator ==(Object other) {
    if (other is UserEntity) if (other.model == this.model &&
        other.role == this.role) return true;
    return false;
  }

  Map<String, Object> toJson() => _$UserEntityToJson(this);

  static UserEntity fromJson(Map<String, Object> json) =>
      _$UserEntityFromJson(json);

  @override
  String toString() {
    /// will give json representation of entity
    return json.encode(this.toJson());
  }
}
