import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';

Container notation({@required String text}) => Container(
      margin: EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 16.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 32.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          color: AppColors.textPrimary,
        ),
      ),
    );
