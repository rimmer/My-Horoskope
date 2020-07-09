import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/components/userinfo_field.dart';
import 'package:app/components/userinfo_picker.dart';

class UserInfo extends StatelessWidget {
  final UserInfoField name;
  final UserInfoField month;
  final UserInfoField day;
  final UserInfoField year;
  final UserInfoPicker sex;
  final UserInfoField country;
  final UserInfoField place;

  UserInfo(
      {@required this.name,
      @required this.month,
      @required this.day,
      @required this.year,
      @required this.sex,
      @required this.country,
      @required this.place});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        name,
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            lang.birthdate,
            style: TextStyle(color: AppColors.textDisabled),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: month,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: day,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: year,
              ),
            ),
            Expanded(flex: 3, child: SizedBox()),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            lang.sex,
            style: TextStyle(color: AppColors.textDisabled),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: sex,
                )),
            Expanded(flex: 6, child: SizedBox()),
          ],
        ),
        country,
        place,
      ],
    );
  }
}
