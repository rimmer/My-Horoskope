import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/cards/prediction.dart';
import 'package:my_horoskope/models/calculations_for_daily_screen.dart';
import 'package:my_horoskope/models/user_details_for_daily_screen.dart';
import 'package:my_horoskope/widgets/card/cards_widget.dart';
import 'package:nil/nil.dart';

class CardsSheet extends StatelessWidget {
  const CardsSheet();

  @override
  Widget build(BuildContext context) {
    final calculation = CalculationsForDailySreen.of(context);
    if (calculation.isNotToday) {
      return nil;
    }

    final userDetails = UserDetailsForDailyScreen.of(context);

    return Prediction(
      toShow: userDetails.propheciesToShow,
      birthDate: userDetails.birthDate,
      prophecy: calculation.prophecy,
      child: const CardsWidget(),
    );
  }
}
