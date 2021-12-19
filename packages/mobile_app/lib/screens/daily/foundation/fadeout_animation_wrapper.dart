import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/routes.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/screens/daily/sheets/ambiance_sheet.dart';
import 'package:my_horoskope/screens/daily/sheets/cards_sheet.dart';
import 'package:my_horoskope/screens/daily/sheets/prophecy_sheet.dart';
import 'package:my_horoskope/widgets/common/appbar.dart';
import 'package:my_horoskope/widgets/common/calendar_items.dart';
import 'package:my_horoskope/widgets/daily_screen/daily_screen_calendar.dart';
import 'package:my_horoskope/screens/daily/sheets/label_and_birth.dart';

class FadeOutAnimationWrapper extends StatelessWidget {
  const FadeOutAnimationWrapper();

  @override
  Widget build(BuildContext context) => CalendarLogic(
        child: const _FadeOutAnimationWrapper(),
        numberOfDays: NUMBER_OF_DAYS_TO_SHOW,
      );
}

class _FadeOutAnimationWrapper extends StatefulWidget {
  const _FadeOutAnimationWrapper();

  @override
  __FadeOutAnimationWrapperState createState() => __FadeOutAnimationWrapperState();
}

class __FadeOutAnimationWrapperState extends State<_FadeOutAnimationWrapper> with SingleTickerProviderStateMixin {
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

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: MyProphetAppBar(
              width: screen.width,
              label: CalendarLogic.of(context).appBarLabel,
              onTap: () {
                Navigator.of(context).pushNamed(AppPath.menu);
              }),
        ),
        SliverToBoxAdapter(
          child: DailyScreenCalendar(
            width: screen.width,
            calendarItemBuilder: dayToWidgetBuilder,
            numberOfDaysToShow: NUMBER_OF_DAYS_TO_SHOW,
          ),
        ),
        const SliverToBoxAdapter(
          child: const SizedBox(
            height: SPACE_BETWEEN_CALENDAR_PROPHECY,
          ),
        ),
        const SliverToBoxAdapter(
          child: const LabelAndBirth(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ProphecySheet(),
              const SizedBox(
                height: SPACE_AFTER_PROPHECY,
              ),
              CardsSheet(),
              AmbianceSheet(),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: const SizedBox(
            height: SPACE_AFTER_AMBIANCE,
          ),
        ),
      ],
    );
  }
}
