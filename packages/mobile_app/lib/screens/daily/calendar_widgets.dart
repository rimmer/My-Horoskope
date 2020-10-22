import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'constants.dart';

Container _date(DateTime date) => Container(
      height: CALENDAR_DATE_HEIGHT,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              date.day.toString(),
              style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              lang.month[date.month].substring(0, 3),
              style: TextStyle(fontSize: 12, color: AppColors.textDisabled),
            ),
          ]),
    );

Widget ordinaryDate(DateTime date) => Padding(
      padding: const EdgeInsets.all(CALENDAR_ORDINARY_DATE_PADDING),
      child: _date(date),
    );

Widget selectedDate(DateTime date) => Container(
      margin: EdgeInsets.all(CALENDAR_SELECTED_DATE_MARGIN),
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
      child: _date(date),
    );

Widget monthSeparator() => Padding(
      padding: EdgeInsets.all(CALENDAR_SEPARATOR_RADIUS),
      child: Text(
        "|",
        style: TextStyle(
          fontSize: 26,
          color: AppColors.textPrimary,
        ),
      ),
    );

Widget newMonthDate(DateTime date) => ordinaryDate(date);

Widget newMonthDateSelected(DateTime date) => selectedDate(date);

Widget yearSeparator(DateTime date) => Padding(
      padding: EdgeInsets.all(CALENDAR_SEPARATOR_RADIUS),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.year.toString(),
            style: TextStyle(
              fontSize: 23,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );

Widget newYearDate(DateTime date) => ordinaryDate(date);

Widget newYearDateSelected(DateTime date) => selectedDate(date);
