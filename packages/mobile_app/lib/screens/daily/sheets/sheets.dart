import 'package:flutter/material.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/screens/daily/sheets/ambiance_sheet.dart';
import 'package:my_horoskope/screens/daily/sheets/cards_sheet.dart';
import 'package:my_horoskope/screens/daily/sheets/label_and_birth.dart';
import 'package:my_horoskope/screens/daily/sheets/prophecy_sheet.dart';

class DailyScreenSheets extends StatelessWidget {
  DailyScreenSheets();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              const SizedBox(
                height: SPACE_BETWEEN_CALENDAR_PROPHECY,
              ),
              const LabelAndBirth(),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ProphecySheet(),
              const SizedBox(
                height: SPACE_AFTER_PROPHECY,
              ),
              CardsSheet(),
              AmbianceSheet(),
              const SizedBox(
                height: SPACE_AFTER_AMBIANCE,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
