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
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.all(0.0), //adds padding inside the button
      minWidth: 0, //wraps child's width
      height: 0,
    ));
