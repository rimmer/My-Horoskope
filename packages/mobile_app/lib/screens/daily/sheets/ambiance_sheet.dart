import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_popups_logic.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/logic/daily_screen/foreseer.dart';
import 'package:my_horoskope/logic/daily_screen/user_details_for_daily_screen.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_button.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_subject_item.dart';
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

    final ambianceSubjects = [
      if (ambianceIsPresent)
        for (final subject in userDetails.user.ambiance)
          AmbiacneSubject(
            onOptionsTap: () {
              popups.setSubjectToChange(subject);
              popups.focusAmbianceChange();
            },
            subject: subject,
            compatibility: foreseer.getCompatibilityWith(subject),
          ),
      const SizedBox(height: 16.0),
      AddAmbianceButton(
        onTap: popups.focusAmbianceAdd,
      ),
    ];

    return SliverToBoxAdapter(
      child: Column(
        children: ambianceSubjects,
      ),
    );
  }
}
