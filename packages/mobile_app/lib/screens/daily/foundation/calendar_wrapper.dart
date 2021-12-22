import 'package:flutter/material.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/models/calculations_for_daily_screen.dart';
import 'package:my_horoskope/models/user_details_for_daily_screen.dart';
import 'package:my_horoskope/routes.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/screens/daily/sheets/sheets.dart';
import 'package:my_horoskope/widgets/common/appbar.dart';
import 'package:my_horoskope/widgets/common/calendar_items.dart';
import 'package:my_horoskope/widgets/daily_screen/daily_screen_calendar.dart';
import 'package:my_horoskope/screens/daily/foundation/label_and_birth.dart';

class CalendarWrapperForDailyScreen extends StatelessWidget {
  const CalendarWrapperForDailyScreen();

  @override
  Widget build(BuildContext context) => CalendarLogic(
        child: const _CalendarWrapperForDailyScreen(),
        numberOfDays: NUMBER_OF_DAYS_TO_SHOW,
      );
}

class _CalendarWrapperForDailyScreen extends StatefulWidget {
  const _CalendarWrapperForDailyScreen();

  @override
  __CalendarWrapperForDailyScreenState createState() => __CalendarWrapperForDailyScreenState();
}

class __CalendarWrapperForDailyScreenState extends State<_CalendarWrapperForDailyScreen>
    with SingleTickerProviderStateMixin {
  bool showCalendarSelection = true;
  AnimationController animationSheetsFadeOutController;
  Animation<double> animationSheetsFadeOut;

  void initAnimations() {
    animationSheetsFadeOutController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    animationSheetsFadeOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationSheetsFadeOutController,
      curve: Curves.ease,
    ));
  }

  void disposeAnimations() {
    animationSheetsFadeOutController.dispose();
  }

  void animationFirstStart() {
    animationSheetsFadeOutController.animateTo(
      animationSheetsFadeOutController.upperBound,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  void calendarTap(BuildContext context, int index) {
    setState(() {
      showCalendarSelection = false;
      animationSheetsFadeOutController.reverse().whenCompleteOrCancel(() {
        setState(() {
          CalendarLogic.of(context).currentDateIndex = index;
          showCalendarSelection = true;
          animationSheetsFadeOutController.forward();
        });
      });
    });
  }

  Widget dayToWidgetBuilder(BuildContext context, int index) {
    final logic = CalendarLogic.of(context);

    if (index == dayToIndex["TODAY"]) {
      /// first element in the list
      return Row(children: [
        SizedBox(width: 16),
        if (dayToIndex["TODAY"] == logic.currentDateIndex)
          if (showCalendarSelection) SelectedDate(logic.day[index]) else OrdinaryDate(logic.day[index])
        else
          TextButton(
            onPressed: () {
              calendarTap(context, index);
            },
            child: OrdinaryDate(logic.day[index]),
          )
      ]);
    } else if (logic.day[index - 1].month != logic.day[index].month) {
      /// new month
      if (index == logic.currentDateIndex)
        return (showCalendarSelection) ? NewMonthSelected(logic.day[index]) : NewMonth(logic.day[index]);
      else
        return TextButton(
          onPressed: () {
            calendarTap(context, index);
          },
          child: NewMonth(logic.day[index]),
        );
    }

    if (index == logic.currentDateIndex)
      return (showCalendarSelection) ? SelectedDate(logic.day[index]) : OrdinaryDate(logic.day[index]);
    else
      return TextButton(
        onPressed: () {
          calendarTap(context, index);
        },
        child: OrdinaryDate(logic.day[index]),
      );
  }

  @override
  void initState() {
    initAnimations();
    super.initState();
    animationFirstStart();
  }

  @override
  void dispose() {
    disposeAnimations();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final calendar = CalendarLogic.of(context);

    final isNotToday = calendar.isNotToday;
    final currentDaySinceEpoch = calendar.currentDay.millisecondsSinceEpoch;
    final prophecy = AppGlobal.prophecyUtil.calculate(
      dt: currentDaySinceEpoch,
      isDebug: AppGlobal.debug.isDebug,
      user: UserDetailsForDailyScreen.of(context).user,
    );

    return CustomScrollView(
      slivers: [
        /// Appbar with calendar
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              MyProphetAppBar(
                  width: screen.width,
                  label: calendar.appBarLabel,
                  onTap: () {
                    Navigator.of(context).pushNamed(AppPath.menu);
                  }),
              DailyScreenCalendar(
                width: screen.width,
                calendarItemBuilder: dayToWidgetBuilder,
                numberOfDaysToShow: NUMBER_OF_DAYS_TO_SHOW,
              ),
            ],
          ),
        ),

        /// Constant user information
        const SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              const SizedBox(
                height: SPACE_BETWEEN_CALENDAR_PROPHECY,
              ),
              const LabelAndBirth(),
            ],
          ),
        ),

        /// Main part of screen
        SliverFadeTransition(
          opacity: animationSheetsFadeOutController,
          sliver: CalculationsForDailySreen(
            prophecy: prophecy,
            dt: currentDaySinceEpoch,
            isNotToday: isNotToday,
            child: SliverList(
              delegate: DailyScreenSheets(),
            ),
          ),
        ),
      ],
    );
  }
}
