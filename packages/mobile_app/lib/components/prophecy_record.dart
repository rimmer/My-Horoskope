import 'package:flutter/material.dart';
import 'package:change_model/change_model.dart';
import 'package:prophecies_repository/prophecies_repository.dart';
import 'package:app/theme/app_colors.dart';

class ProphecyRecord extends StatelessWidget {
  final ProphecyEntity prophecy;

  ProphecyRecord({Key key, @required this.prophecy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double value = prophecy.model.value ?? 0.0;
    for (ChangeModel change in prophecy.changes) value += change.value;
    var valuePercent = value / 10;
    return Container(
      margin: EdgeInsets.all(8.0),
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
                    fontSize: 16.0,
                    color: AppColors.textPrimary,
                  ),
                )),
                Text(
                  value.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 26.0,
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
  final List<ChangeModel> changes;
  ChangesList(this.changes);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: changes.length,
      itemBuilder: (BuildContext context, int index) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(changes[index].changeIconName,
              style: TextStyle(
                fontSize: 16.0,
                color: AppColors.textPrimary,
              )),
          Text(
              " ${changes[index].changeText}(${(changes[index].value >= 0.0) ? '+' : '-'} ${changes[index].value.toStringAsFixed(1)})",
              style: TextStyle(
                fontSize: 16.0,
                color: AppColors.textPrimary,
              )),
        ],
      ),
    );
  }
}
