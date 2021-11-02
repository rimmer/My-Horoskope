import 'package:flutter/material.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:my_horoskope/common/card/big_card/type/prophecy.dart';
import 'package:my_horoskope/common/card/big_card/type/tarrot.dart';
import 'package:my_horoskope/logic/cards/cards_logic.dart';
import 'package:symbol/symbol.dart';

import 'package:my_horoskope/common/card/ads_resolver.dart';
import 'prediction_card.dart';
import 'card_placeholder.dart';
import 'type/color.dart';
import 'type/number.dart';
import 'type/gem.dart';

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

    if (AppGlobal.ads.adsWatched) CardsLogic.of(context).adsWatched = true;

    /// if need to see ads inside debug mode, comment this line
    // if (AppGlobal.adsDisabled) CardsLogic.of(context).adsWatched = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (CardsLogic.of(context).adsWatched) {
      return PredictionCard(
        type: cardType[CardsLogic.of(context).choise],
      );
    }

    if (!CardsLogic.of(context).adsWatched && CardsLogic.of(context).currentBigCardIsEmpty) {
      return const CardPlaceholder();
    }

    if (!CardsLogic.of(context).adsWatched &&
        !CardsLogic.of(context).currentBigCardIsEmpty &&
        CardsLogic.of(context).dontShowAds) {
      return PredictionCard(
        type: cardType[CardsLogic.of(context).choise],
      );
    }

    if (!CardsLogic.of(context).adsWatched && !CardsLogic.of(context).dontShowAds) {
      return CardsAdsResolver();
    }

    final choise = CardsLogic.of(context).choise;
    if (choise == CardType.TEXT)
      return PredictionCard(
        type: cardType[choise],
        padding: const EdgeInsets.only(top: 8.0),
      );

    return PredictionCard(
      type: cardType[choise],
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
