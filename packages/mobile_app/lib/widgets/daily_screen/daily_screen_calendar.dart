import 'package:flutter/widgets.dart';
import 'package:my_horoskope/theme/app_colors.dart';
import 'package:my_horoskope/widgets/common/calendar_items.dart';

class DailyScreenCalendar extends StatelessWidget {
  const DailyScreenCalendar({
    @required this.width,
    @required this.calendarItemBuilder,
    @required this.numberOfDaysToShow,
  });
  final double width;
  final Widget Function(BuildContext, int) calendarItemBuilder;
  final int numberOfDaysToShow;

  @override
  Widget build(BuildContext context) => Container(
      height: CALENDAR_HEIGHT,
      width: width,
      child: Container(
        decoration: BoxDecoration(color: AppColors.calendarBackground.withOpacity(0.8), boxShadow: [
          BoxShadow(
            color: AppColors.calendarShadow.withOpacity(0.34),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ]),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: numberOfDaysToShow,
          itemBuilder: calendarItemBuilder,
        ),
      ));
}
