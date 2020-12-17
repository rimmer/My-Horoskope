import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:prophecies/prophecies.dart';
import 'package:language/language.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:users_repository/users_repository.dart';

Container prophecyRecord(
    {@required ProphecyEntity prophecy,
    @required Map<bool, String> planetVariants}) {
  //

  final textExists = prophecy.text != null && prophecy.text.isNotEmpty;
  final value = prophecy.value ?? 0.0;
  final valuePercent = value / 10;

  final isPositive = value > 4.9;
  final planetName =
      (isPositive) ? planetVariants[true] : planetVariants[false];

  final planetImpact = (((

                  /// calcualte percent from no value,
                  /// but its remainder of ten, if negative
                  (isPositive) ? value : (10.0 - value))

              /// %34
              /
              100.0) *
          34.0) *

      /// if negative change sign
      ((isPositive) ? 1 : -1);

  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0),
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
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Row(
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
                    fontSize: 21.0,
                    fontWeight: FontWeight.w400,
                    color: chooseNumberColor(value),
                  ),
                ),
              ),
            ],
          ),
        ),
        (textExists)
            ? Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Text(
                  prophecy.text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textPrimary,
                  ),
                ),
              )
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: prophecyPlanet(
              planetName: planetName,
              color: AppColors.textPrimary,
              impactNumber: planetImpact),
        ),
        Container(
          height: 8.0,
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
  );
}

Container prophecyPlanet(
    {@required String planetName,
    @required Color color,
    @required double impactNumber}) {
  return Container(
    padding: EdgeInsets.only(top: 8),
    child: Wrap(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 8),
          height: 32,
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/$planetName.svg",
                color: color,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                  "${lang.impact.capitalize()} ${lang.planetImpact[planetName]} (${impactNumber.toStringAsFixed(1)})",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: color,
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}

Color chooseNumberColor(double value) {
  return chooseNumberColorFromThreeVariants(value);
}

String userRole(UserRole role) {
  String result = "";

  if (role == UserRole.USER) result = lang.you.capitalize();

  return result;
}
