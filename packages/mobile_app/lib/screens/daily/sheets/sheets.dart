import 'package:flutter/material.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/screens/daily/sheets/ambiance_sheet.dart';
import 'package:my_horoskope/screens/daily/sheets/cards_sheet.dart';
import 'package:my_horoskope/screens/daily/sheets/prophecy_sheet.dart';

class DailyScreenSheets extends SliverChildListDelegate {
  DailyScreenSheets()
      : super(
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
        );
}
