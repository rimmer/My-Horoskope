import 'package:flutter/material.dart';
import 'package:symbol/symbol.dart';
import 'big_card/big_card.dart';
import 'deck_card/deck_cards.dart';

class CardsWidget extends StatelessWidget {
  final PreparedSymbolCombination combination;

  const CardsWidget({
    @required this.combination,
  });

  @override
  Widget build(BuildContext context) => ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        children: [
          BigCard(combination: combination),
          const DeckCards(),
        ],
      );
}
