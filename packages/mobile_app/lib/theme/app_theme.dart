import 'package:flutter/material.dart';
import 'app_colors.dart';

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
