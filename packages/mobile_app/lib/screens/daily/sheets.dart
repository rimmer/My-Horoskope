import 'package:algorithm/planets.dart';
import 'package:base/int_datetime.dart';
import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_logic.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/logic/daily_screen/foreseer.dart';
import 'package:my_horoskope/logic/daily_screen/user_details_for_daily_screen.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_button.dart';
import 'package:my_horoskope/widgets/common/birth_row.dart';
import 'package:my_horoskope/widgets/daily_screen/daily_screen_label_and_birth.dart';
import 'package:my_horoskope/widgets/prophecy/prophecy_sheet.dart';

class SheetsList extends StatelessWidget {
  const SheetsList();

  @override
  Widget build(BuildContext context) => Foreseer(
        forUser: UserDetailsForDailyScreen.of(context).user,
        child: _SheetsList(),
      );
}

class _SheetsList extends StatelessWidget {
  const _SheetsList();

  @override
  Widget build(BuildContext context) {
    final userDetails = UserDetailsForDailyScreen.of(context);
    final calendar = CalendarLogic.of(context);
    final foreseer = Foreseer.of(context);
    final currentDaySinceEpoch = calendar.currentDay.millisecondsSinceEpoch;
    final isToday = calendar.isToday;

    foreseer.calculateProphecy(dt: currentDaySinceEpoch);
    final Map<bool, String> currentPlanets = planetFor[currentDaySinceEpoch.astroSign][userDetails.astroSign];

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          DailyScreenLabelAndBirth(
            label: userDetails.label,
            birthRow: BirthRow(
              info: BirthRowInfo(
                birthDate: userDetails.birthDate,
                astroSign: userDetails.astroSign,
              ),
            ),
          ),
          ProphecySheet(
            prophecies: foreseer.currentProphecy,
            planets: currentPlanets,
            toShow: userDetails.propheciesToShow,
          ),
          const SizedBox(
            height: SPACE_AFTER_PROPHECY,
          ),
          AddAmbianceButton(
            onTap: AmbiancePopupsLogic.of(context).focusAmbianceAdd,
          ),
          const SizedBox(
            height: SPACE_AFTER_AMBIANCE,
          ),
        ],
      ),
    );
  }
}
