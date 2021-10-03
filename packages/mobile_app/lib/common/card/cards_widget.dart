import 'package:flutter/material.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:my_horoskope/common/card/big_card/type/prophecy.dart';
import 'package:my_horoskope/common/card/big_card/type/tarrot.dart';
import 'package:my_horoskope/logic/cards/cards_logic.dart';
import 'package:symbol/symbol.dart';

import 'ads_resolver.dart';
import 'big_card/card.dart';
import 'big_card/placeholder.dart';
import 'big_card/type/color.dart';
import 'big_card/type/number.dart';
import 'big_card/type/gem.dart';
import 'big_card/type/text.dart';
import 'deck_card/deck_cards.dart';

class CardsWidget extends StatefulWidget {
  final PreparedSymbolCombination combination;

  CardsWidget({
    @required this.combination,
  });

  @override
  CardsWidgetState createState() => CardsWidgetState();
}

class CardsWidgetState extends State<CardsWidget> {
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
      CardType.TEXT: CardTypeProphecy(),
    };

    if (AppGlobal.ads.adsWatched) CardsLogic.of(context).adsWatched = true;

    /// if need to see ads inside debug mode, comment this line
    // if (AppGlobal.adsDisabled) CardsLogic.of(context).adsWatched = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        if (CardsLogic.of(context).adsWatched)
          PredictionCard(
            type: cardType[CardsLogic.of(context).choise],
          ),
        //
        if (!CardsLogic.of(context).adsWatched && CardsLogic.of(context).currentBigCardIsEmpty) const CardPlaceholder(),
        //
        if (!CardsLogic.of(context).adsWatched &&
            !CardsLogic.of(context).currentBigCardIsEmpty &&
            CardsLogic.of(context).dontShowAds)
          PredictionCard(
            type: cardType[CardsLogic.of(context).choise],
          ),
        //
        if (!CardsLogic.of(context).adsWatched && !CardsLogic.of(context).dontShowAds) CardsAdsResolver(),
        //
        //
        const DeckCards(),
      ],
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
