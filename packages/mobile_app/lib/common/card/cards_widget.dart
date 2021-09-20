import 'package:flutter/material.dart';
import 'package:base/cards.dart';
import 'package:base/preferences/setting/enabled_prophecies/item.dart';
import 'package:my_horoskope/common/card/big_card/type/tarrot.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:my_horoskope/logic/ads.dart';
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

    if (AppGlobal.ads.adsWatched) cards.adsWatched = true;

    /// if need to see ads inside debug mode, comment this line
    // if (AppGlobal.adsDisabled) cards.adsWatched = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(child: Builder(builder: (_) {
          /// if no card was chosen then current big card is empty
          if (cards.currentBigCardIsEmpty) {
            /// so we show card placeholder
            return const CardPlaceholder();
          } else {
            /// if some card was chosen
            /// and it is time to build ads
            if (cards.toBuildAds) {
              /// we build our ads card
              if (AppGlobal.ads.adsConsentNeeded &&
                  !AppGlobal.ads.adsConsentGiven) {
                return PredictionCardWithButton(
                    text: localeText.adsGiveConcent,
                    buttonText: localeText.adsGiveConcentButton.toUpperCase(),
                    onButtonTap: adsOnConsent);
              } else if (AppGlobal.ads.adsLoaded) {
                return PredictionCardWithButton(
                    text: localeText.adsCardDescription,
                    buttonText: localeText.watchAdsButton.toUpperCase(),
                    onButtonTap: adsOnAdsAvailable);
              } else {
                return PredictionCardWithButton(
                  text: localeText.adsErrorLoadingText,
                  textFontSize: 14,
                  buttonText: localeText.adsErrorLoadingButton.toUpperCase(),
                  onButtonTap: adsOnNotAvailable,
                );
              }
            } else {
              /// otherwise we build our big card
              return PredictionCard(
                type: cardType[cards.choise],
              );
            }
          }
        })),
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

  adsOnNotAvailable() {
    /// It doesn't send event when no internet, and don't send it on the next start
    /// need to discuss
    // logEventNoInternetForAds();

    // ignore: invalid_use_of_protected_member
    setState(() {
      cards.whenAdsWatched();
    });
  }

  adsOnAdsAvailable() {
    if (!AppGlobal.ads.adsWatched)
      AppGlobal.ads.manager.show().then((_) => setState(() {
            cards.whenAdsWatched();
          }));
  }

  adsOnConsent() {
    // because of a bug in `flutter-appodeal` we need to force the user
    // to press the button twice because there is no way of getting the status
    // of the concent after the dialog is closed.
    // `Appodeal.requestConsentAuthorization()` exits immidiately after call
    // see https://github.com/vegidio/flutter-appodeal/blob/master/android/src/main/kotlin/io/vinicius/appodeal_flutter/AppodealFlutterPlugin.kt#L203
    checkConsentGivenAndInit().then((_) {
      if (AppGlobal.ads.adsConsentNeeded && !AppGlobal.ads.adsConsentGiven)
        AppGlobal.ads.manager.askUserConcent();
      else
        setState(() {});
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
