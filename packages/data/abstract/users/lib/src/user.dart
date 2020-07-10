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
class User {
  final int id;
  UserRole role;
  UserModel model;
  List<User> ambiance;
  bool lastLogin;

  User({
    id,
    this.role = UserRole.USER,
    this.ambiance = const [],
    this.lastLogin = false,
    @required this.model,
  }) : this.id = id ?? model.hashCode;

  Map<String, Object> toJson() => _$UserToJson(this);

  static User fromJson(Map<String, Object> json) => _$UserFromJson(json);
}
