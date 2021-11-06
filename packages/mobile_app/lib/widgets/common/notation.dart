import 'package:flutter/material.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'package:my_horoskope/theme/app_colors.dart';

class Notation extends StatelessWidget {
  final String text;

  const Notation(this.text);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 32.0,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.prophecyGradientStart.withOpacity(0.9),
                AppColors.prophecyGradientEnd.withOpacity(0.9),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(8.0)),
        child: Text(
          text,
          style: AppTextStyle.normalText,
        ),
      );
}
