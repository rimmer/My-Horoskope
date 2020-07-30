import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_model/user_model.dart';

part 'user.g.dart';

enum UserRole {
  NONE,
  USER,
  SOULMATE,
  FRIEND,
}

@JsonSerializable()
class UserEntity {
  final int id;
  UserRole role;
  UserModel model;
  List<UserEntity> ambiance;
  bool lastLogin;
  bool pollAvailability;
  bool pollStudying;

  UserEntity({
    id,
    this.role = UserRole.USER,
    this.ambiance = const [],
    this.lastLogin = false,
    @required this.model,
    this.pollAvailability = true,
    this.pollStudying = false,
  }) : this.id = id ?? model.hashCode;

  Map<String, Object> toJson() => _$UserEntityToJson(this);

  static UserEntity fromJson(Map<String, Object> json) =>
      _$UserEntityFromJson(json);

  @override
  String toString() {
    return json.encode(this.toJson());
  }
}
