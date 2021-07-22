import 'package:flutter/material.dart';
import 'package:base/cards.dart';
import 'package:base/preferences/setting/enabled_prophecies/item.dart';
import 'package:my_prophet/components/card/big_card/type/tarrot.dart';
import 'package:my_prophet/services/static_provider.dart';
import 'package:text/text.dart';
import 'package:symbol/symbol.dart';

import 'big_card/card.dart';
import 'big_card/card_with_button.dart';
import 'big_card/placeholder.dart';
import 'big_card/type/color.dart';
import 'big_card/type/number.dart';
import 'big_card/type/gem.dart';
import 'big_card/type/text.dart';
import 'deck_card.dart';

class CardsWidget extends StatefulWidget {
  final EnabledProphecies toShow;
  final String Function() predictionTextCallback;
  final PreparedSymbolCombination combination;

  CardsWidget({
    @required this.toShow,
    @required this.predictionTextCallback,
    @required this.combination,
  });

  @override
  CardsWidgetState createState() => CardsWidgetState();
}

class CardsWidgetState extends State<CardsWidget> {
  Cards cards;
  Map<CardType, Widget> cardType;

  @override
  void initState() {
    cards = Cards();

    int numberOfCards = (widget.toShow.ambition ? 1 : 0) +
        (widget.toShow.internalStrength ? 1 : 0) +
        (widget.toShow.intuition ? 1 : 0) +
        (widget.toShow.luck ? 1 : 0) +
        (widget.toShow.moodlet ? 1 : 0);
    if (numberOfCards == 0) numberOfCards = 1;
    cards.maxNumberOfCards = numberOfCards;

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
      CardType.TEXT: CardTypeText(
        text: widget.predictionTextCallback(),
      ),
    };

    if (StaticProvider.ads.adsAreWatched) cards.adsWatched = true;

    /// if need to see ads inside debug mode, comment this line
    if (StaticProvider.adsAreDisabled) cards.adsWatched = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(
          child:

              /// if no card was chosen then current big card is empty
              cards.currentBigCardIsEmpty

                  /// so we show card placeholder
                  ? const CardPlaceholder()

                  /// if some card was chosen
                  /// and it is time to build ads
                  : cards.toBuildAds

                      /// we build our ads card
                      ? StaticProvider.internetAvailable
                          ? PredictionCardWithButton(
                              text: localeText.adsCardDescription,
                              buttonText:
                                  localeText.watchAdsButton.toUpperCase(),
                              onButtonTap:
                                  (StaticProvider.ads.watchAdsButtonIsInactive)
                                      ? () {}
                                      : () {
                                          adsOnInternetAvailable();
                                        },
                            )
                          : PredictionCardWithButton(
                              text: localeText.noInternetText,
                              textFontSize: 14,
                              buttonText:
                                  localeText.noInternetButton.toUpperCase(),
                              onButtonTap: adsOnNoInternet,
                            )

                      /// otherwise we build our big card
                      : PredictionCard(
                          type: cardType[cards.choise],
                        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _deckCardBuilder(CardType.COLOR),
            _deckCardBuilder(CardType.NUMBER),
            _deckCardBuilder(CardType.TARROT),
            _deckCardBuilder(CardType.GEM),
            _deckCardBuilder(CardType.TEXT),
          ],
        ),
      ],
    );
  }

  adsOnNoInternet() {
    /// It doesn't send event when no internet, and don't send it on the next start
    /// need to discuss
    // logEventNoInternetForAds();

    // ignore: invalid_use_of_protected_member
    setState(() {
      cards.whenAdsWatched();
    });
  }

  adsOnInternetAvailable() async {
    // ignore: invalid_use_of_protected_member
    setState(() {
      StaticProvider.ads.watchAdsButtonIsInactive = true;
    });

    if (StaticProvider.ads.adsAreWatched == false)
      await StaticProvider.ads.manager.show();

    // ignore: invalid_use_of_protected_member
    setState(() {
      cards.whenAdsWatched();
    });
  }

  Padding _deckCardBuilder(CardType cardType) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.0),
        child: GestureDetector(
          onTap: () {
            // ignore: invalid_use_of_protected_member
            setState(() {
              /// if card clicked - choose it
              cards.choise = cardType;
            });
          },
          child: (cards.choise == cardType && cards.cardShown[cardType])

              /// if current card is chosen
              ? DeckCard(
                  mode: DeckCardMode.CHOSEN, icon: cardTypeToString[cardType])
              : (cards.cardShown[cardType])

                  /// if our card was chosen once
                  ? DeckCard(
                      mode: DeckCardMode.WAS_CHOSEN,
                      icon: cardTypeToString[cardType])

                  /// if our card was not clicked at all
                  : DeckCard(
                      mode: DeckCardMode.INTACT,
                      icon: cardTypeToString[cardType]),
        ),
      );
}
