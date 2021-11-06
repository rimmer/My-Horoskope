import 'package:my_horoskope/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:text/text.dart';

const CALENDAR_HEIGHT = 80.0;
const CALENDAR_DATE_HEIGHT = 56.0;
const CALENDAR_DATE_PADDING = 14.0;
const CALENDAR_SELECTED_DATE_MARGIN = 4.0;
const CALENDAR_SELECTED_DATE_PADDING = 14.0;

class _Date extends StatelessWidget {
  final DateTime date;
  final Color dayColor;
  final Color monthColor;

  const _Date(
    this.date,
    this.dayColor,
    this.monthColor,
  );

  @override
  Widget build(BuildContext context) => Container(
        height: CALENDAR_DATE_HEIGHT,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                date.day.toString(),
                style: TextStyle(fontSize: 16, color: dayColor),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                localeText.month[date.month].substring(0, 3),
                style: TextStyle(fontSize: 12, color: monthColor),
              ),
            ]),
      );
}

class OrdinaryDate extends StatelessWidget {
  final DateTime date;

  const OrdinaryDate(this.date);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
        child: _Date(date, AppColors.textPrimary, AppColors.textDisabled),
      );
}

class SelectedDate extends StatelessWidget {
  final DateTime date;

  const SelectedDate(this.date);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(CALENDAR_SELECTED_DATE_MARGIN),
        padding: const EdgeInsets.all(CALENDAR_SELECTED_DATE_PADDING),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.calendarDateSelected.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: <Color>[
              AppColors.accentDark,
              AppColors.accent,
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: _Date(date, AppColors.textPrimary, AppColors.textDisabled),
      );
}

class NewMonth extends StatelessWidget {
  final DateTime date;

  const NewMonth(this.date);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
        child: _Date(date, AppColors.calendarNewMonthDay,
            AppColors.calendarNewMonthMonth),
      );
}

class NewMonthSelected extends StatelessWidget {
  final DateTime date;

  const NewMonthSelected(this.date);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(CALENDAR_SELECTED_DATE_MARGIN),
        padding: const EdgeInsets.all(CALENDAR_SELECTED_DATE_PADDING),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.calendarDateSelected.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: <Color>[
              AppColors.accentDark,
              AppColors.accent,
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: _Date(date, AppColors.textPrimary, AppColors.textDisabled),
      );
}

class NewYear extends StatelessWidget {
  final DateTime date;

  const NewYear(this.date);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
        child: _Date(date, AppColors.calendarNewMonthDay,
            AppColors.calendarNewMonthMonth),
      );
}

class NewYearSelected extends StatelessWidget {
  final DateTime date;

  const NewYearSelected(this.date);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(CALENDAR_SELECTED_DATE_MARGIN),
        padding: const EdgeInsets.all(CALENDAR_SELECTED_DATE_PADDING),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.calendarDateSelected.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: <Color>[
              AppColors.accentDark,
              AppColors.accent,
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: _Date(date, AppColors.textPrimary, AppColors.textDisabled),
      );
}
