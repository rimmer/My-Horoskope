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

  bool isCurrent = false;
  bool wasChosen = false;

  @override
  Widget build(BuildContext context) {
    if (CardsLogic.of(context).choise == type) {
      isCurrent = true;
      return DeckCardInner(
        mode: DeckCardMode.CHOSEN,
        icon: cardTypeToString[type],
      );
    }
    isCurrent = false;

    if (CardsLogic.of(context).cardShown[type]) {
      wasChosen = true;
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
        if (wasChosen) {
          if (CardsLogic.of(context).choise != type && !isCurrent || CardsLogic.of(context).choise == type && isCurrent)
            return;
        } else if (!wasChosen && !CardsLogic.of(context).cardShown[type]) {
          return;
        }

        setState(() {});
      } catch (_) {}
    });
    super.didChangeDependencies();
  }
}
