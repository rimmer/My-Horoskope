import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/cards/cards_logic.dart';
import 'deck_card_outer.dart';

class DeckCard extends StatelessWidget {
  const DeckCard({
    @required this.cardType,
  });

  final CardType cardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: GestureDetector(
        onTap: () {
          CardsLogic.of(context).choice = cardType;
        },
        child: DeckCardOuter(cardType: cardType),
      ),
    );
  }
}
