import 'dart:ui';

import 'package:my_prophet/theme/app_text_style.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

const _temp = "ru";
const URL_PRIVACY_POLICY =
    "https://rimmer.github.io/My-Prophet/privacy_policy/$_temp.html";
const URL_USER_AGREEMENT =
    "https://rimmer.github.io/My-Prophet/user_agreement/$_temp.html";

class AcceptTermsText extends StatelessWidget {
  final String text;
  final bool isController;

  const AcceptTermsText(this.text, {this.isController = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12,
          color: (isController)
              ? AppColors.textDisabled
              : AppColors.textSecondary),
    );
  }
}

class TermsText extends StatelessWidget {
  final String text;
  final String url;

  const TermsText({@required this.text, @required this.url});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launch(url),
      child: Text(
        text,
        style: AppTextStyle.termsText,
      ),
    );
  }
}
