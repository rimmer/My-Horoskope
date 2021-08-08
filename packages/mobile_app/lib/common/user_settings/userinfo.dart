import 'package:flutter/material.dart';
import 'package:text/text.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import '../userinfo_field.dart';
import '../userinfo_picker.dart';

class UserInfo extends StatelessWidget {
  final UserInfoField name;
  final UserInfoField month;
  final UserInfoField day;
  final UserInfoField year;
  final UserInfoPicker sex;

  const UserInfo(
      {@required this.name,
      @required this.month,
      @required this.day,
      @required this.year,
      @required this.sex});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        name,
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 4.0),
          child: Text(
            localeText.birthdate.capitalize(),
            style: AppTextStyle.fadeText,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: day,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: month,
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
          padding: const EdgeInsets.only(top: 16.0, left: 4.0),
          child: Text(
            localeText.sex.capitalize(),
            style: AppTextStyle.fadeText,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 4.0,
                  ),
                  child: sex,
                )),
            Expanded(flex: 6, child: SizedBox()),
          ],
        ),
      ],
    );
  }
}
