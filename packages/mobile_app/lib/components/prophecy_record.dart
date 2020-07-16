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
    double value = prophecy.model.value ?? 0.0;
    for (ImpactModel change in prophecy.changes) value += change.value;
    var valuePercent = value / 10;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(20.0),
      height: 96.0,
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
                Text(
                  value.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 22.0,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ChangesList(prophecy.changes)),
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

class ChangesList extends StatelessWidget {
  final List<ImpactModel> changes;
  ChangesList(this.changes);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            Text(
                " ${curImp.changeText}($sign ${curImp.value.toStringAsFixed(1)})",
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
