import 'package:flutter/material.dart';
import 'package:my_horoskope/theme/app_colors.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

const URL_PRIVACY_POLICY = "https://myhoroskope.app/privacy_policy/:lang.html";
const URL_USER_AGREEMENT = "https://myhoroskope.app/user_agreement/:lang.html";

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
  final String lang;

  const TermsText(
      {@required this.text, @required this.url, @required this.lang});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launch(url.replaceFirst(":lang", lang)),
      child: Text(
        text,
        style: AppTextStyle.termsText,
      ),
    );
  }
}
