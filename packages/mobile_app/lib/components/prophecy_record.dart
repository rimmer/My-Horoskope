import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:prophecies/prophecies.dart';
import 'package:language/language.dart';
import 'package:my_prophet/theme/app_colors.dart';

Padding prophecyRecord({
  @required ProphecyEntity prophecy,
}) {
  //

  final value = prophecy.value ?? 0.0;
  final valuePercent = value / 100;

  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 6.0,
      horizontal: 2.0,
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            lang.prophecyId[prophecy.id.toStr],
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${value.toStringAsFixed(0)}%",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0),
              height: 4.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.prophecyValueProgressGradientBorder),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                gradient: LinearGradient(colors: [
                  AppColors.prophecyValueProgressGradient[0],
                  AppColors.prophecyValueProgressGradient[1],
                  AppColors.prophecyValueProgressGradient[2],
                  AppColors.prophecyValueProgressGradient[3],
                  AppColors.prophecyValueProgressGradient[4],
                  AppColors.prophecyValueProgressGradient[5],
                  AppColors.prophecyValueProgressGradient[6],
                  AppColors.prophecyValueProgressGradient[7],
                  AppColors.prophecyValueProgressGradient[8],
                  AppColors.prophecyValueProgressGradient[8],
                  Colors.transparent
                ], stops: [
                  0.0,
                  0.1,
                  (valuePercent > 0.3) ? 0.3 : valuePercent,
                  (valuePercent > 0.4) ? 0.4 : valuePercent,
                  (valuePercent > 0.5) ? 0.5 : valuePercent,
                  (valuePercent > 0.6) ? 0.6 : valuePercent,
                  (valuePercent > 0.7) ? 0.7 : valuePercent,
                  (valuePercent > 0.8) ? 0.8 : valuePercent,
                  (valuePercent > 0.9) ? 0.9 : valuePercent,
                  (valuePercent > 1.0) ? 1.0 : valuePercent,
                  valuePercent,
                ]),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
