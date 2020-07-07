import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interface.g.dart';

@JsonSerializable()
class Locale {
  final String name;
  final String birthdate;
  final String birthcountry;
  final String birthplace;
  final String sex;
  final String male;
  final String female;
  final String other;
  final String notSelectedSex;
  final String termsAccept;
  final String privacyPolicy;
  final String userAgreement;

  Locale(
      {@required this.name,
      @required this.birthdate,
      @required this.birthcountry,
      @required this.birthplace,
      @required this.sex,
      @required this.male,
      @required this.female,
      @required this.other,
      @required this.notSelectedSex,
      @required this.termsAccept,
      @required this.privacyPolicy,
      @required this.userAgreement});

  Map<String, Object> toJson() => _$LocaleToJson(this);

  static Locale fromJson(Map<String, Object> json) => _$LocaleFromJson(json);
}
