import 'package:flutter/material.dart';
import 'package:text/text.dart';
import 'package:my_horoskope/theme/app_colors.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'gradient_border_button.dart';
import 'notavaible_button.dart';

class NotAvailableButton extends StatelessWidget {
  const NotAvailableButton();
  @override
  Widget build(BuildContext context) => NotAvaibleInfo(
        child: GradientBorderButton(
          child: Text(
            localeText.addAmbiance.toUpperCase(),
            style: AppTextStyle.normalText,
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.accentDark,
              AppColors.accent,
              AppColors.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderAsPadding: const EdgeInsets.all(1.0),
          background: AppColors.primaryDark,
          internalPadding:
              const EdgeInsets.symmetric(horizontal: 38, vertical: 12.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          onPressed: null,
        ),
        title: localeText.noAmbianceTitle.capitalize(),
        desc: localeText.noAmbianceDescription,
        button: localeText.noAmbianceButton.toUpperCase(),
      );
}
