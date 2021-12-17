import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_popups_logic.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/logic/daily_screen/foreseer.dart';
import 'package:my_horoskope/logic/daily_screen/user_details_for_daily_screen.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_button.dart';
import 'package:my_horoskope/widgets/daily_screen/daily_screen_ambiance_list.dart';
import 'package:nil/nil.dart';

class AmbianceSheet extends StatelessWidget {
  const AmbianceSheet();

  @override
  Widget build(BuildContext context) {
    final isNotToday = CalendarLogic.of(context).isNotToday;
    if (isNotToday) {
      return nil;
    }

    final popups = AmbiancePopupsLogic.of(context);
    final userDetails = UserDetailsForDailyScreen.of(context);
    final foreseer = Foreseer.of(context);
    final ambianceIsPresent = userDetails.user.ambiance != null && userDetails.user.ambiance.isNotEmpty;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        if (ambianceIsPresent)
          DailyScreenAmbianceList(
            getCompatibility: foreseer.getCompatibilityWith,
            focusAmbianceChange: popups.focusAmbianceChange,
            ambiance: userDetails.user.ambiance,
            setAmbianceChangeSubject: popups.setSubjectToChange,
          ),
        AddAmbianceButton(
          onTap: popups.focusAmbianceAdd,
        ),
      ],
    );
  }
}
