import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import './userinfo_field.dart';
import './userinfo_picker.dart';

Column userInfo(
    {@required UserInfoField name,
    @required UserInfoField month,
    @required UserInfoField day,
    @required UserInfoField year,
    @required UserInfoPicker sex,
    @required UserInfoField country,
    @required UserInfoField place}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      name,
      Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 4.0),
        child: Text(
          lang.birthdate.capitalize(),
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
        padding: const EdgeInsets.only(top: 16.0, left: 4.0),
        child: Text(
          lang.sex.capitalize(),
          style: TextStyle(color: AppColors.textDisabled),
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
      country,
      place,
    ],
  );
}
