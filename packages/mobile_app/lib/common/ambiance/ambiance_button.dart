import 'package:flutter/material.dart';
import 'package:text/text.dart';
import 'package:my_horoskope/theme/app_colors.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import '../gradient_border_button.dart';

class AddAmbianceButton extends StatelessWidget {
  final Function onTap;
  const AddAmbianceButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBorderButton(
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
      onPressed: onTap,
    );
  }
}
