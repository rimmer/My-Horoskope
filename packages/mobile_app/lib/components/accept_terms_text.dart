import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AcceptTermsText extends StatelessWidget {
  final bool isController;
  final String text;
  AcceptTermsText(this.text, {this.isController = false});
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
