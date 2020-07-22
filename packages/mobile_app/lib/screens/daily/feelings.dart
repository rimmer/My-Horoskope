import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';

class Feelings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 192.0,
      decoration: BoxDecoration(
          color: AppColors.userPollBackground,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
