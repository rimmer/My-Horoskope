import 'package:my_prophet/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'package:prophecy_model/prophecy_model.dart';

ListView prophecyIsLoading() {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    children: <Widget>[
      prophecyRecordLoading(prophecyName: ProphecyType.INTERNAL_STRENGTH.toStr),
      prophecyRecordLoading(prophecyName: ProphecyType.MOODLET.toStr),
      prophecyRecordLoading(prophecyName: ProphecyType.AMBITION.toStr),
      prophecyRecordLoading(prophecyName: ProphecyType.INTELLIGENCE.toStr),
      prophecyRecordLoading(prophecyName: ProphecyType.LUCK.toStr),
    ],
  );
}

Container prophecyRecordLoading({@required String prophecyName}) => Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 128.0,
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
