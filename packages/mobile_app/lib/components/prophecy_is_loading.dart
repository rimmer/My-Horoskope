import 'package:flutter/material.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:users_repository/users_repository.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'prophecy_record.dart';

import 'package:int_datetime/int_datetime.dart';
import 'package:algorithm/astro.dart' show BasicAstrology;

class ProphecyIsLoading extends StatelessWidget {
  final UserEntity user;
  final labelStr;
  final birthRow = MutableObject(null);

  ProphecyIsLoading({@required this.user})
      : labelStr = "${user.model.name.capitalize()} (${userRole(user.role)})" {
    final dt = user.model.birth.toDateTime;
    final sign = user.model.birth.astroSign;
    final mainPlanet = user.model.birth.astroHousePlanet;
    birthRow.wrapped = Row(
      children: <Widget>[
        SvgPicture.asset("assets/icons/$sign.svg"),
        Text(" ${dt.day}.${dt.month}.${dt.year} ",
            style: TextStyle(fontSize: 14)),
        SvgPicture.asset("assets/icons/$mainPlanet.svg"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelStr,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        birthRow.wrapped,
        ProphecyRecordLoading(
            prophecyName: ProphecyType.INTERNAL_STRENGTH.toStr),
        ProphecyRecordLoading(prophecyName: ProphecyType.MOODLET.toStr),
        ProphecyRecordLoading(prophecyName: ProphecyType.AMBITION.toStr),
        ProphecyRecordLoading(prophecyName: ProphecyType.INTELLIGENCE.toStr),
        ProphecyRecordLoading(prophecyName: ProphecyType.LUCK.toStr),
      ],
    );
  }
}

class ProphecyRecordLoading extends StatelessWidget {
  final String prophecyName;
  ProphecyRecordLoading({@required this.prophecyName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 68.0,
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
      child: Column(
        children: <Widget>[
          Container(
            height: 60.0,
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      lang.prophecyId[prophecyName],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.textPrimary,
                      ),
                    )),
                    Center(
                      child: Text(" "),
                    ),
                  ],
                ),
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
                Colors.transparent
              ], stops: [
                0.0,
                0.1,
                0.2,
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
