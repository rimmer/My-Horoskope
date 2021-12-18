import 'package:flutter/material.dart';
import 'package:symbol/symbol.dart';
import 'big_card/big_card.dart';
import 'deck_card/deck_cards.dart';
import 'package:my_horoskope/logic/cards/prediction.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget();

  @override
  Widget build(BuildContext context) {
    final PreparedSymbolCombination combination = getSymbolCombination(Prediction.of(context).prophecy);

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        BigCard(combination: combination),
        const DeckCards(),
      ],
    );
  }
}
