import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';

class DailyPageWrappedWithCalendarLogic extends StatelessWidget {
  const DailyPageWrappedWithCalendarLogic();

  @override
  Widget build(BuildContext context) => CalendarLogic(
        child: _CalendarWrapper(),
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
    return Container();
  }
}
