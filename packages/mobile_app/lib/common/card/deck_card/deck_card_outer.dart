import 'package:flutter/material.dart';
import 'package:my_horoskope/common/card/deck_card/deck_card_inner.dart';
import 'package:my_horoskope/logic/cards/cards_logic.dart';

class DeckCardOuter extends StatefulWidget {
  const DeckCardOuter({
    @required this.cardType,
  });

  final CardType cardType;
  @override
  _DeckCardOuterState createState() => _DeckCardOuterState();
}

class _DeckCardOuterState extends State<DeckCardOuter> {
  CardType get type => widget.cardType;

  @override
  Widget build(BuildContext context) {
    if (CardsLogic.of(context).choise == type) {
      return DeckCardInner(
        mode: DeckCardMode.CHOSEN,
        icon: cardTypeToString[type],
      );
    }

    if (CardsLogic.of(context).cardShown[type]) {
      return DeckCardInner(
        mode: DeckCardMode.WAS_CHOSEN,
        icon: cardTypeToString[type],
      );
    }

    return DeckCardInner(
      mode: DeckCardMode.INTACT,
      icon: cardTypeToString[type],
    );
  }

  @override
  void didChangeDependencies() {
    CardsLogic.of(context).addListener(() {
      try {
        setState(() {});
      } catch (_) {}
    });
    super.didChangeDependencies();
  }
}
