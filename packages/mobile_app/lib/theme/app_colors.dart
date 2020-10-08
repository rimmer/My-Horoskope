import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF5937B2);
  static const primaryDark = Color(0xFF260D6C);
  static const primaryLight = Color(0xFF7A49B8);
  static const accent = Color(0xFFFAA835);
  static const accentDark = Color(0xFFF94D49);
  static const secondary = Color(0xFFAAAAAA);
  static const splashBackground = Color(0xFF18004C);

  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFD795FF);
  static const textDisabled = Color(0x88FFFFFF);

  static const prophecyGradientStart = Color(0xff3E218D);
  static const prophecyGradientEnd = Color(0xff4837B2);

  // must have 9 colors, from index 0 to 8
  static const prophecyValueProgressGradient = [
    Color(0xff5D2DA0),
    Color(0xff5E3AAC),
    Color(0xff5F46B8),
    Color(0xff5F53C4),
    Color(0xff605FCF),
    Color(0xff5765CD),
    Color(0xff4F6ACA),
    Color(0xff4770C8),
    Color(0xff3F74C6),
  ];

  // must have 3 colors, from index 0 to 2
  static const prophecyValueNumber = [
    Color(0xffD795FF),
    Colors.white,
    Color(0xff68FFE4),
  ];

  static const userPollBackground = Color(0xff1F0A57);
}

Color chooseNumberColorFromThreeVariants(double value) {
  if (value < 3.5) return AppColors.prophecyValueNumber[0];
  if (value < 7.0) return AppColors.prophecyValueNumber[1];
  return AppColors.prophecyValueNumber[2];
}

Color chooseNumberColorFromProgressValueBar(double value) {
  if (value < 2.5) return AppColors.prophecyValueProgressGradient[0];
  if (value < 3) return AppColors.prophecyValueProgressGradient[1];
  if (value < 4) return AppColors.prophecyValueProgressGradient[2];
  if (value < 5) return AppColors.prophecyValueProgressGradient[3];
  if (value < 6) return AppColors.prophecyValueProgressGradient[4];
  if (value < 7) return AppColors.prophecyValueProgressGradient[5];
  if (value < 8) return AppColors.prophecyValueProgressGradient[6];
  if (value < 9) return AppColors.prophecyValueProgressGradient[7];
  return AppColors.prophecyValueProgressGradient[8];
}
