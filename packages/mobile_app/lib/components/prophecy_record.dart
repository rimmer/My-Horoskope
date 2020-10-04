import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:prophecies/prophecies.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:users_repository/users_repository.dart';

Container prophecyRecord({@required ProphecyEntity prophecy}) {
  final textExists = prophecy.text != null && prophecy.text.isNotEmpty;

  double value = prophecy.value ?? 0.0;

  var valuePercent = value / 10;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0),
    height: 68.0 + ((textExists) ? 128 : 0),
    child: Column(
      children: <Widget>[
        Container(
          height: 60.0 + ((textExists) ? 128 : 0),
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    lang.prophecyId[prophecy.id.toStr],
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColors.textPrimary,
                    ),
                  )),
                  Center(
                    child: Text(
                      value.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                        color: chooseNumberColor(value),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: prophecyTextWidget(
                textExists: textExists,
                text: prophecy.text,
              )),
            ],
          ),
        ),
        Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
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
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.prophecyGradientStart.withOpacity(0.7),
            AppColors.prophecyGradientEnd.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(8.0)),
  );
}

Container prophecyTextWidget({@required bool textExists, String text = ""}) {
  if (textExists) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Wrap(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 116,
            child: ListView(
              children: <Widget>[
                Text("$text",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.textPrimary,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  } else
    return Container();
}

Color chooseNumberColor(double value) {
  return chooseNumberColorFromThreeVariants(value);
}

String userRole(UserRole role) {
  if (role == UserRole.USER) return lang.you.capitalize();
}
