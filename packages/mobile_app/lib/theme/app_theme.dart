import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    accentColor: AppColors.accent,
    errorColor: AppColors.textError,

    ///
    colorScheme: ColorScheme.dark(
      background: AppColors.primaryDark,
      onBackground: AppColors.primaryLight,
      primary: AppColors.primary,
      primaryVariant: AppColors.primaryDark,
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.accent,
      secondaryVariant: AppColors.accentDark,
      onSecondary: AppColors.textSecondary,
      surface: AppColors.primary,
      onSurface: AppColors.textPrimary,
      error: AppColors.primaryDark,
      onError: AppColors.primaryLight,
    ),

    // Define the default font family.
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.primaryDark,
    //
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0.0),
      ),
    ));
