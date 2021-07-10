import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  static const cardText = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
  );

  static const fadeText = TextStyle(color: AppColors.textDisabled);
  static const normalText = TextStyle(
    fontSize: 14,
    color: AppColors.textPrimary,
  );

  static const labelText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
  );
  static const gradientButton = labelText;

  static const menuItem = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18,
  );
  static const popupTitle = TextStyle(
    fontSize: 18,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );
  static const appbar = TextStyle(
    fontSize: 20.0,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );

  // - - -

  static const prophecyLabel = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );
  static const prophecyPercent = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const userName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
  static const titleDescription = TextStyle(
    color: AppColors.textDisabled,
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
  );
  static const accentBlackBoardText = TextStyle(
    fontSize: 19.0,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );
  static const termsText = TextStyle(
    fontSize: 11,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );
  static const backgroundLabel = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
  );
}
