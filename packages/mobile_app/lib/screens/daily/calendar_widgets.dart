import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'constants.dart';

Container _date(DateTime date) => Container(
      height: calendarDateHeight,
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
      padding: const EdgeInsets.all(calendarOrdinaryDatePadding),
      child: _date(date),
    );

Widget selectedDate(DateTime date) => Container(
      margin: EdgeInsets.all(calendarSelectedDateMargin),
      padding: EdgeInsets.all(calendarSelectedDatePadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.calendarSelection[0],
            AppColors.calendarSelection[1],
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: _date(date),
    );

Widget monthSeparator() => Padding(
      padding: EdgeInsets.all(calendarSeparatorPadding),
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
      padding: EdgeInsets.all(calendarSeparatorPadding),
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
