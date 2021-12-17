import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/logic/daily_screen/foreseer.dart';
import 'package:my_horoskope/logic/daily_screen/user_details_for_daily_screen.dart';
import 'package:my_horoskope/screens/daily/ambiance_sheet.dart';
import 'package:my_horoskope/screens/daily/cards_sheet.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/screens/daily/prophecy_sheet.dart';
import 'package:my_horoskope/widgets/daily_screen/daily_screen_label_and_birth.dart';

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
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const DailyScreenLabelAndBirth(),
        const ProphecySheet(),
        const SizedBox(
          height: SPACE_AFTER_PROPHECY,
        ),
        const CardsSheet(),
        const AmbianceSheet(),
        const SizedBox(
          height: SPACE_AFTER_AMBIANCE,
        ),
      ],
    );
  }
}
