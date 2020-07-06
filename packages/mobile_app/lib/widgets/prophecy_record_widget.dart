import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:prophecy_model/prophecy_model.dart';

class ProphecyRecordWidget extends StatelessWidget {
  final Prophecy prophecy;

  ProphecyRecordWidget({Key key, @required this.prophecy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var valuePercent = prophecy.value / 10;
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            prophecy.name,
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.textPrimary,
            ),
          )),
          Text(
            prophecy.value?.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 26.0,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColor
          ], stops: [
            0.0,
            valuePercent,
            valuePercent + 0.01
          ]),
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
