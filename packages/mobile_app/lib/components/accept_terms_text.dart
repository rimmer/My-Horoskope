import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';

Text acceptTermsText(String text, {bool isController = false}) => Text(
      text,
      style: TextStyle(
          fontSize: 12,
          color: (isController)
              ? AppColors.textDisabled
              : AppColors.textSecondary),
    );
