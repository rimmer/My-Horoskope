import 'package:my_prophet/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:text/text.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              localeText.month[date.month].substring(0, 3),
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
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );

Widget newMonth(DateTime date) => Padding(
      padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
      child: _date(
          date, AppColors.calendarNewMonthDay, AppColors.calendarNewMonthMonth),
    );

Widget newMonthSelected(DateTime date) => Container(
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
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );

Widget newYear(DateTime date) => Padding(
      padding: const EdgeInsets.all(CALENDAR_DATE_PADDING),
      child: _date(
          date, AppColors.calendarNewMonthDay, AppColors.calendarNewMonthMonth),
    );

Widget newYearSelected(DateTime date) => Container(
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
      child: _date(date, AppColors.textPrimary, AppColors.textDisabled),
    );

Widget calendarNotation({Function onClick}) => Container(
      decoration: BoxDecoration(
        color: AppColors.clickableNotationBackground.withOpacity(0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SvgPicture.asset(
              "assets/widget/calendar_notation_leftarrow.svg",
              color: AppColors.textPrimary.withOpacity(0.5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                localeText.calendarHint,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14.0,
                ),
              ),
              GestureDetector(
                onTap: onClick,
                child: Text(
                  localeText.understood,
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              "assets/widget/calendar_notation_rightarrow.svg",
              color: AppColors.textPrimary.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
