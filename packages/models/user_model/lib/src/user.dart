import 'package:dataclass/dataclass.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@JsonSerializable()
@dataClass
class UserModel extends _$UserModel {
  final String name;
  final int birth;
  final int sex;
  final String country;
  final String place;

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
