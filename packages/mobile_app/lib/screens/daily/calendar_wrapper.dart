import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/routes.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/widgets/common/appbar.dart';
import 'package:my_horoskope/widgets/common/calendar_items.dart';
import 'package:my_horoskope/widgets/daily_screen/daily_screen_calendar.dart';

class DailyPageWrappedWithCalendarLogic extends StatelessWidget {
  const DailyPageWrappedWithCalendarLogic();

  @override
  Widget build(BuildContext context) => CalendarLogic(
        child: const _CalendarWrapper(),
        numberOfDays: NUMBER_OF_DAYS_TO_SHOW,
      );
}

class _CalendarWrapper extends StatefulWidget {
  const _CalendarWrapper();

  @override
  __CalendarWrapperState createState() => __CalendarWrapperState();
}

class __CalendarWrapperState extends State<_CalendarWrapper> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        MyProphetAppBar(
            width: screen.width,
            label: CalendarLogic.of(context).appBarLabel,
            onTap: () {
              Navigator.of(context).pushNamed(AppPath.menu);
            }),
        DailyScreenCalendar(
          width: screen.width,
          calendarItemBuilder: dayToWidget,
          numberOfDaysToShow: NUMBER_OF_DAYS_TO_SHOW,
        ),
      ],
    );
  }

  Widget dayToWidget(BuildContext context, int index) {
    final logic = CalendarLogic.of(context);

    if (index == dayToIndex["TODAY"]) {
      /// first element in the list
      return Row(children: [
        SizedBox(width: 16),
        if (dayToIndex["TODAY"] == logic.currentDateIndex)
          if (dat.showCalendarSelection) SelectedDate(logic.day[index]) else OrdinaryDate(logic.day[index])
        else
          TextButton(
            onPressed: () => logic.currentDateIndex = index,
            child: OrdinaryDate(logic.day[index]),
          )
      ]);
    } else if (logic.day[index - 1].month != logic.day[index].month) {
      /// new month
      if (index == logic.currentDateIndex)
        return (dat.showCalendarSelection) ? NewMonthSelected(logic.day[index]) : NewMonth(logic.day[index]);
      else
        return TextButton(
          onPressed: () => logic.currentDateIndex = index,
          child: NewMonth(logic.day[index]),
        );
    }

    if (index == logic.currentDateIndex)
      return (dat.showCalendarSelection) ? SelectedDate(logic.day[index]) : OrdinaryDate(logic.day[index]);
    else
      return TextButton(
        onPressed: () => logic.currentDateIndex = index,
        child: OrdinaryDate(logic.day[index]),
      );
  }
}
