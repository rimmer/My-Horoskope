import 'package:algorithm/planets.dart';
import 'package:base/int_datetime.dart';
import 'package:flutter/material.dart';
import 'package:my_horoskope/models/calculations_for_daily_screen.dart';
import 'package:my_horoskope/models/user_details_for_daily_screen.dart';
import 'package:my_horoskope/widgets/prophecy/prophecies.dart';

class ProphecySheet extends StatelessWidget {
  const ProphecySheet();

  @override
  Widget build(BuildContext context) {
    final userDetails = UserDetailsForDailyScreen.of(context);
    final calculation = CalculationsForDailySreen.of(context);
    final Map<bool, String> currentPlanets = planetFor[calculation.dt.astroSign][userDetails.astroSign];

    return Prophecies(
      prophecies: calculation.prophecy,
      planets: currentPlanets,
      toShow: userDetails.propheciesToShow,
    );
  }
}
