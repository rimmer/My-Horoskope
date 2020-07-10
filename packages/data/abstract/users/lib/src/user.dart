import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:user_model/user_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final UserModel model;
  User({
    id,
    @required this.model,
  }) : this.id = id ?? model.hashCode;

  Map<String, Object> toJson() => _$UserToJson(this);

  static User fromJson(Map<String, Object> json) => _$UserFromJson(json);
}
