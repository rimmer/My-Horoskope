import 'package:base/int_datetime.dart';
import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/cards/prediction.dart';
import 'package:my_horoskope/logic/daily_screen/calendar_logic.dart';
import 'package:my_horoskope/logic/daily_screen/foreseer.dart';
import 'package:my_horoskope/logic/daily_screen/user_details_for_daily_screen.dart';
import 'package:my_horoskope/widgets/card/cards_widget.dart';
import 'package:nil/nil.dart';

class CardsSheet extends StatelessWidget {
  const CardsSheet();

  @override
  Widget build(BuildContext context) {
    final isNotToday = CalendarLogic.of(context).isNotToday;
    if (isNotToday) {
      return nil;
    }

    final prophecy = Foreseer.of(context).calculateProphecy(dt: dtDay);
    final userDetails = UserDetailsForDailyScreen.of(context);

    return Prediction(
      toShow: userDetails.propheciesToShow,
      birthDate: userDetails.birthDate,
      prophecy: prophecy,
      child: const CardsWidget(),
    );
  }
}
