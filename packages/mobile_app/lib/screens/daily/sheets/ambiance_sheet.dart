import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_popups_logic.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_compatibility.dart';
import 'package:my_horoskope/models/calculations_for_daily_screen.dart';
import 'package:my_horoskope/models/user_details_for_daily_screen.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_button.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_subject_item.dart';
import 'package:nil/nil.dart';

class AmbianceSheet extends StatelessWidget {
  const AmbianceSheet();

  @override
  Widget build(BuildContext context) {
    final calculation = CalculationsForDailySreen.of(context);
    if (calculation.isNotToday) {
      return nil;
    }

    final popups = AmbiancePopupsLogic.of(context);
    final userDetails = UserDetailsForDailyScreen.of(context);
    final ambianceIsPresent = userDetails.user.ambiance != null && userDetails.user.ambiance.isNotEmpty;
    final compatibility = AmbianceCompatibility.of(context);

    final ambianceSubjects = [
      if (ambianceIsPresent)
        for (final subject in userDetails.user.ambiance)
          AmbiacneSubject(
            onOptionsTap: () {
              popups.setSubjectToChange(subject);
              popups.focusAmbianceChange();
            },
            subject: subject,
            compatibility: compatibility.getCompatibilityWith(subject),
          ),
      const SizedBox(height: 16.0),
      AddAmbianceButton(
        onTap: popups.focusAmbianceAdd,
      ),
    ];

    return Column(
      children: ambianceSubjects,
    );
  }
}
