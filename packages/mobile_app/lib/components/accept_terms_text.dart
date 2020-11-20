import 'dart:ui';

import 'package:app/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

const _temp = "ru";
const URL_PRIVACY_POLICY =
    "https://rimmer.github.io/my_prophet/privacy_policy/$_temp.html";
const URL_USER_AGREEMENT =
    "https://rimmer.github.io/my_prophet/user_agreement/$_temp.html";

Text acceptTermsText(String text, {bool isController = false}) => Text(
      text,
      style: TextStyle(
          fontSize: 12,
          color: (isController)
              ? AppColors.textDisabled
              : AppColors.textSecondary),
    );

FlatButton termsText({@required String text, @required String url}) =>
    FlatButton(
      onPressed: () => launch(url),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        ),
      ),
    );
