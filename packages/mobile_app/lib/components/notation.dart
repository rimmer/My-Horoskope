import 'package:flutter/material.dart';
import 'package:my_prophet/theme/app_colors.dart';

Container notation({@required String text}) => Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 32.0,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.prophecyGradientStart.withOpacity(0.9),
              AppColors.prophecyGradientEnd.withOpacity(0.9),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          color: AppColors.textPrimary,
        ),
      ),
    );
