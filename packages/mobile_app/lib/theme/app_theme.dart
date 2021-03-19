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
    scaffoldBackgroundColor: AppColors.primaryDark,

    /// DONT REMOVE IT
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) {
          return EdgeInsets.all(0.0);
        }), //adds padding inside the button
      ),
    ));
