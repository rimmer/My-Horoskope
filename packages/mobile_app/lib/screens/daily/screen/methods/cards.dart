part of '../screen.dart';

extension DailyScreenCardsMethods on _DailyScreenState {
  ListView cards() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(
          child:

              /// if no card was chosen then current big card is empty
              _cards.currentBigCardIsEmpty

                  /// so we show card placeholder
                  ? BigCardPlaceholder()

                  /// if some card was chosen
                  /// and it is time to build ads
                  : StaticProvider.adsAreDisabled == false && _cards.toBuildAds

                      /// we build our ads card
                      ? BigCardAds(
                          action: () {
                            onWatchAdsClick();
                          },
                        )

                      /// otherwise we build our big card
                      : BigCard(
                          text: getPrediction(
                            /// and add needed text to it
                            /// if conditions same, it will create a new state and will not rebuild the card
                            type: cardTypeToProphecy[_cards.choise],
                          ),
                        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// here is our small cards row
            (toShow.moodlet) ? _smallCardBuilder(CardType.TREE) : SizedBox(),
            (toShow.intuition) ? _smallCardBuilder(CardType.COIN) : SizedBox(),
            (toShow.luck) ? _smallCardBuilder(CardType.STAR) : SizedBox(),
            (toShow.ambition) ? _smallCardBuilder(CardType.SWORD) : SizedBox(),
            (toShow.internalStrength)
                ? _smallCardBuilder(CardType.CUP)
                : SizedBox(),
            //
            (toShow.internalStrength == false &&
                    toShow.moodlet == false &&
                    toShow.ambition == false &&
                    toShow.intuition == false &&
                    toShow.luck == false)
                ? _smallCardBuilder(CardType.STAR)
                : SizedBox()
          ],
        ),
      ],
    );
  }

  onWatchAdsClick() async {
    final internet = await internetCheck();
    if (internet == true) {
      // ignore: invalid_use_of_protected_member
      setState(() {
        if (StaticProvider.ads.cardAd == null) StaticProvider.ads.initCardAd();
        StaticProvider.ads.cardAd.load();
        StaticProvider.ads.cardAd.show();
      });
    } else {
      print("no internet connection!");
    }
  }

  Padding _smallCardBuilder(CardType cardType) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.0),
        child: GestureDetector(
          onTap: () {
            // ignore: invalid_use_of_protected_member
            setState(() {
              /// if card clicked - choose it
              _cards.choise = cardType;
            });
          },
          child: (_cards.choise == cardType && _cards.cardShown[cardType])

              /// if current card is chosen
              ? SmallCard(
                  mode: SmallCardMode.CHOSEN, icon: cardTypeToString[cardType])
              : (_cards.cardShown[cardType])

                  /// if our card was chosen once
                  ? SmallCard(
                      mode: SmallCardMode.WASCHOSEN,
                      icon: cardTypeToString[cardType])

                  /// if our card was not clicked at all
                  : SmallCard(
                      mode: SmallCardMode.INTACT,
                      icon: cardTypeToString[cardType]),
        ),
      );
}
