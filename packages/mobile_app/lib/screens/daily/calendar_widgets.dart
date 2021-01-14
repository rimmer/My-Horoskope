import 'package:my_prophet/theme/app_colors.dart';
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
      padding: const EdgeInsets.only(
          top: CALENDAR_ORDINARY_DATE_PADDING,
          bottom: CALENDAR_ORDINARY_DATE_PADDING,
          right: CALENDAR_ORDINARY_DATE_PADDING),
      child: _date(date),
    );

Widget utilityDate(DateTime date) => _date(date);

Widget selectedDate(DateTime date) => Container(
      margin: const EdgeInsets.only(
          top: CALENDAR_SELECTED_DATE_MARGIN,
          bottom: CALENDAR_SELECTED_DATE_MARGIN,
          right: CALENDAR_SELECTED_DATE_MARGIN * 2),
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

Widget selectedUtilityDate(DateTime date) => Container(
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
      padding: const EdgeInsets.only(
        top: CALENDAR_SEPARATOR_RADIUS,
        bottom: CALENDAR_SEPARATOR_RADIUS,
      ),
      child: Text(
        "|",
        style: TextStyle(
          fontSize: 26,
          color: AppColors.textPrimary,
        ),
      ),
    );

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
