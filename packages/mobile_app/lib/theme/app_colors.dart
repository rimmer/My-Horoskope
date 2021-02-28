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

  static const prophecyGradientStart = Color(0xff3C2087);
  static const prophecyGradientEnd = Color(0xff4837B2);

  static const appBarBackground = Color(0xff3F1D9D);
  static const calendarBackground = Color(0xff301774);
  static const calendarShadow = Colors.black;
  static const calendarNewMonthDay = Color(0xffFA9A67);
  static const calendarNewMonthMonth = Color(0xff814B6F);
  static const calendarDateSelected = Color(0xffF9793F);

  static const negativeImpact = Color(0xffD13B5C);
  static const positiveImpact = Color(0xff68FFE4);

  static const prophecyValueProgressGradientBorder = Color(0xff210A61);

  static const userPollTabActive = Color(0xff7175D6);
  static const userPollTabInactive = Color(0xff412387);

  static const clickableNotationBackground = Color(0xff0F0039);

  // must have 9 colors, from index 0 to 8
  static const prophecyValueProgressGradient = [
    Color(0xff540096),
    Color(0xff7F1483),
    Color(0xffA72870),
    Color(0xffD13B5C),
    Color(0xffF94F49),
    Color(0xffFA6445),
    Color(0xffFA7B40),
    Color(0xffFA913B),
    Color(0xffFAA736),
  ];
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
