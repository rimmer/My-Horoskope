import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF5937B2);
  static const primaryDark = Color(0xFF260D6C);
  static const primaryLight = Color(0xFF7A49B8);
  static const accent = Color(0xFFFAA835);
  static const accentDark = Color(0xFFF94D49);
  static const secondary = Color(0xFFAAAAAA);

  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFD795FF);
  static const textDisabled = Color(0x88FFFFFF);

  static const prophecyGradientStart = Color(0xff3E218D);
  static const prophecyGradientEnd = Color(0xff4837B2);

  static const prophecyValueStartStart = Color(0xff5D2DA0);
  static const prophecyValueStart = Color(0xff5E3AAC);
  static const prophecyValueStartEnd = Color(0xff5F46B8);
  static const prophecyValueMiddleStart = Color(0xff5F53C4);
  static const prophecyValueMiddle = Color(0xff605FCF);
  static const prophecyValueMiddleEnd = Color(0xff5765CD);
  static const prophecyValueEndStart = Color(0xff4F6ACA);
  static const prophecyValueEnd = Color(0xff4770C8);
  static const prophecyValueEndEnd = Color(0xff3F74C6);

  static const prophecyValueNumberStart = Color(0xffD795FF);
  static const prophecyValueNumberMiddle = Colors.white;
  static const prophecyValueNumberEnd = Color(0xff68FFE4);
}

Color chooseNumberColorFromThreeVariants(double value) {
  if (value < 5) return AppColors.prophecyValueNumberStart;
  if (value < 8) return AppColors.prophecyValueNumberMiddle;
  return AppColors.prophecyValueNumberEnd;
}

Color chooseNumberColorFromProgressValueBar(double value) {
  if (value < 2.5) return AppColors.prophecyValueStart;
  if (value < 3) return AppColors.prophecyValueStartStart;
  if (value < 4) return AppColors.prophecyValueStartEnd;
  if (value < 5) return AppColors.prophecyValueMiddleStart;
  if (value < 6) return AppColors.prophecyValueMiddle;
  if (value < 7) return AppColors.prophecyValueMiddleEnd;
  if (value < 8) return AppColors.prophecyValueEndStart;
  if (value < 9) return AppColors.prophecyValueEnd;
  return AppColors.prophecyValueEndEnd;
}
