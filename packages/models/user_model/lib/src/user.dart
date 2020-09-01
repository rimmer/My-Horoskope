import 'package:dataclass/dataclass.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// user model stores basic user information like a name and birthdate

@JsonSerializable()
@dataClass
class UserModel extends _$UserModel {
  final String name;
  final String country;
  final String place;

  /// birth date in milliseconds since epoch
  final int birth;

  /// sex:
  /// 0 - not selected
  /// 1 - male
  /// 2 - female
  /// 3 - other
  final int sex;

  UserModel(
      {@required this.name,
      @required this.birth,
      @required this.sex,
      @required this.country,
      @required this.place});

  Map<String, Object> toJson() => _$UserModelToJson(this);

  static UserModel fromJson(Map<String, Object> json) =>
      _$UserModelFromJson(json);
}
