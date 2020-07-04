import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    accentColor: AppColors.accent,

    // Define the default font family.
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.primaryDark);
