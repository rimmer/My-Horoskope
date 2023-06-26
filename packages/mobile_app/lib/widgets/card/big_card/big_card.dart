import 'package:flutter/material.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:my_horoskope/logic/cards/cards_logic.dart';
import 'package:my_horoskope/widgets/card/ads_resolver.dart';
import 'package:my_horoskope/widgets/card/big_card/type/prophecy.dart';
import 'package:my_horoskope/widgets/card/big_card/type/tarrot.dart';
import 'package:symbol/symbol.dart';

import 'card_placeholder.dart';
import 'prediction_card.dart';
import 'type/color.dart';
import 'type/gem.dart';
import 'type/number.dart';

class BigCard extends StatefulWidget {
  const BigCard({
    @required this.combination,
  });

  final PreparedSymbolCombination combination;

  @override
  BigCardState createState() => BigCardState();
}

class BigCardState extends State<BigCard> {
  Map<CardType, Widget> cardType;

  @override
  void initState() {
    cardType = {
      CardType.COLOR: CardTypeColor(
        first: widget.combination.colors[0],
        second: widget.combination.colors[1],
        third: widget.combination.colors[2],
      ),
      CardType.NUMBER: CardTypeNumber(
        numberName: widget.combination.digit,
      ),
      CardType.TARROT: CardTypeTarrot(
        tarrotName: widget.combination.tarrot,
      ),
      CardType.GEM: CardTypeGem(
        gemName: widget.combination.mineral,
      ),
      CardType.TEXT: const CardTypeProphecy(),
    };

    /// if need to see ads inside debug mode, comment this line
    // if (AppGlobal.adsDisabled) CardsLogic.of(context).adsWatched = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _cardsLogic = CardsLogic.of(context);
    if (_cardsLogic.adsWatched) {
      return PredictionCard(
        type: cardType[_cardsLogic.choice],
      );
    }

    if (!_cardsLogic.adsWatched &&
        _cardsLogic.currentBigCardIsEmpty) {
      return const CardPlaceholder();
    }

    if (!_cardsLogic.adsWatched &&
        !_cardsLogic.currentBigCardIsEmpty &&
        _cardsLogic.dontShowAds) {
      return PredictionCard(
        type: cardType[_cardsLogic.choice],
      );
    }

    if (!_cardsLogic.adsWatched &&
        !_cardsLogic.dontShowAds) {
      return CardsAdsResolver();
    }

    final choice = _cardsLogic.choice;
    if (choice == CardType.TEXT)
      return PredictionCard(
        type: cardType[choice],
        padding: const EdgeInsets.only(top: 8.0),
      );

    return PredictionCard(
      type: cardType[choice],
    );
  }

  @override
  void didChangeDependencies() {
    var _cardsLogic = CardsLogic.of(context);
    _cardsLogic.addListener(() {
      try {
        setState(() {});
      } catch (_) {}
      // TODO: listener shall be removed with `_cardsLogic.removeListener`
    });
    if (AppGlobal.ads.adsWatched) _cardsLogic.adsWatched = true;
    super.didChangeDependencies();
  }
}
