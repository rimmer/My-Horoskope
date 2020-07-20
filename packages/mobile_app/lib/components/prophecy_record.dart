import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:impact_model/impact_model.dart';
import 'package:prophecies_repository/prophecies_repository.dart';
import 'package:app/theme/app_colors.dart';

class ProphecyRecord extends StatelessWidget {
  final ProphecyEntity prophecy;

  ProphecyRecord({Key key, @required this.prophecy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changesCount = prophecy.changes.length;

    double value = prophecy.model.value ?? 0.0;

    for (ImpactModel change in prophecy.changes) value += change.value;

    var valuePercent = value / 10;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 68.0 + (36.0 * changesCount),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 60.0 + (36.0 * changesCount),
              padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          prophecy.model.name,
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
                  ),
                  Expanded(child: ChangesList(prophecy.changes)),
                ],
              ),
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
                AppColors.prophecyValueStartStart,
                AppColors.prophecyValueStart,
                AppColors.prophecyValueStartEnd,
                AppColors.prophecyValueMiddleStart,
                AppColors.prophecyValueMiddle,
                AppColors.prophecyValueMiddleEnd,
                AppColors.prophecyValueEndStart,
                AppColors.prophecyValueEnd,
                AppColors.prophecyValueEndEnd,
                AppColors.prophecyValueEndEnd,
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
}

class ChangesList extends StatelessWidget {
  final List<ImpactModel> changes;
  ChangesList(this.changes);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: (changes.length > 0)
          ? EdgeInsets.only(top: 8)
          : EdgeInsets.only(top: 0),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: changes.length,
      itemBuilder: (BuildContext context, int index) {
        final curImp = changes[index];
        final sign = (curImp.value >= 0.0) ? '+' : '-';
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset("assets/icons/${curImp.changeIconName}.svg"),
            SizedBox(width: 8),
            Text(
                " ${curImp.changeText} ($sign ${curImp.value.toStringAsFixed(1)})",
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.textPrimary,
                )),
          ],
        );
      },
    );
  }
}

Color chooseNumberColor(double value) {
  return chooseNumberColorFromThreeVariants(value);
}
