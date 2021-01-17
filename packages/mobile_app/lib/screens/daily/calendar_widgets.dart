import 'package:my_prophet/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'constants.dart';

Container _date(DateTime date, Color dayColor, Color monthColor) => Container(
      height: CALENDAR_DATE_HEIGHT,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              date.day.toString(),
              style: TextStyle(fontSize: 16, color: dayColor),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              lang.month[date.month].substring(0, 3),
              style: TextStyle(fontSize: 12, color: monthColor),
            ),
          ]),
    );

Widget ordinaryDate(DateTime date) => Padding(
      padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );

Widget selectedDate(DateTime date) => Container(
      margin: const EdgeInsets.all(CALENDAR_SELECTED_DATE_MARGIN),
      padding: EdgeInsets.all(CALENDAR_SELECTED_DATE_PADDING),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.accentDark,
            AppColors.accent,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );

Widget newMonth(DateTime date) => Padding(
      padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
      child: _date(
          date, AppColors.calendarNewMonthDay, AppColors.calendarNewMonthDay),
    );

Widget newMonthSelected(DateTime date) => Container(
      margin: const EdgeInsets.all(CALENDAR_SELECTED_DATE_MARGIN),
      padding: EdgeInsets.all(CALENDAR_SELECTED_DATE_PADDING),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.accentDark,
            AppColors.accent,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );

Widget newYear(DateTime date) => Padding(
      padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );

Widget newYearSelected(DateTime date) => Container(
      margin: const EdgeInsets.all(CALENDAR_SELECTED_DATE_MARGIN),
      padding: EdgeInsets.all(CALENDAR_SELECTED_DATE_PADDING),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.accentDark,
            AppColors.accent,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );
