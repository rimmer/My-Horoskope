import 'package:flutter/material.dart';
import 'package:my_prophet/theme/app_colors.dart';

class ProphecySheetDivider extends StatelessWidget {
  const ProphecySheetDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.0,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.prophecyGradientEnd.withOpacity(0.8),
            AppColors.prophecyGradientStart.withOpacity(0.8),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
        ),
      ),
    );
  }
}
