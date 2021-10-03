import 'package:flutter/material.dart';
import 'package:my_horoskope/common/card/deck_card/deck_card.dart';
import 'package:my_horoskope/logic/cards/cards_logic.dart';

class DeckCards extends StatelessWidget {
  const DeckCards();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          const DeckCard(cardType: CardType.COLOR),
          const DeckCard(cardType: CardType.NUMBER),
          const DeckCard(cardType: CardType.TARROT),
          const DeckCard(cardType: CardType.GEM),
          const DeckCard(cardType: CardType.TEXT),
        ],
      );
}
