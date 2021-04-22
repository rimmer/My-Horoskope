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
                  ? PredictionCardPlaceholder()

                  /// if some card was chosen
                  /// and it is time to build ads
                  : StaticProvider.adsAreDisabled == false && _cards.toBuildAds

                      /// we build our ads card
                      ? _cards.internetAvailable
                          ? PredictionCardWithButton(
                              text: localeText.adsCardDescription,
                              buttonText:
                                  localeText.watchAdsButton.toUpperCase(),
                              onButtonTap: () {
                                onWatchAdsClick();
                              })
                          : PredictionCardWithButton(
                              text: localeText.noInternetText,
                              textFontSize: 14,
                              buttonText:
                                  localeText.noInternetButton.toUpperCase(),
                              onButtonTap: adsOnNoInternet,
                            )

                      /// otherwise we build our big card
                      : PredictionCard(
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
            (toShow.moodlet) ? _tarrotCardBuilder(CardType.TREE) : SizedBox(),
            (toShow.intuition) ? _tarrotCardBuilder(CardType.COIN) : SizedBox(),
            (toShow.luck) ? _tarrotCardBuilder(CardType.STAR) : SizedBox(),
            (toShow.ambition) ? _tarrotCardBuilder(CardType.SWORD) : SizedBox(),
            (toShow.internalStrength)
                ? _tarrotCardBuilder(CardType.CUP)
                : SizedBox(),
            //
            (toShow.internalStrength == false &&
                    toShow.moodlet == false &&
                    toShow.ambition == false &&
                    toShow.intuition == false &&
                    toShow.luck == false)
                ? _tarrotCardBuilder(CardType.STAR)
                : SizedBox()
          ],
        ),
      ],
    );
  }

  onWatchAdsClick() async {
    _cards.internetAvailable = await internetCheck();
    if (_cards.internetAvailable == true)
      await adsOnInternetAvailable();
    else {
      // ignore: invalid_use_of_protected_member
      setState(() {});
    }
  }

  adsOnNoInternet() {
    /// It doesn't send event when no internet, and don't send it on the next start
    /// need to discuss
    // StaticProvider.firebase.analytics.logEvent(name: "no_internet_for_ads");

    // ignore: invalid_use_of_protected_member
    setState(() {
      _cards.whenAdsWatched();
    });
  }

  adsOnInternetAvailable() async {
    getAdsManager(
        // for some reason `await card.load()
        onLoaded: (ad) {
          ad.show();
        },
        onWatched: () {
          // ignore: invalid_use_of_protected_member
          setState(() {
            _cards.whenAdsWatched();
          });
        },
        onFailed: (error) {
          // ignore: invalid_use_of_protected_member
          setState(() {
            _cards.whenAdsWatched();
          });
        },
        isDebug: StaticProvider.debug.isDebug)
    .load();
  }

  Padding _tarrotCardBuilder(CardType cardType) => Padding(
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
              ? TarrotCard(
                  mode: TarrotCardMode.CHOSEN, icon: cardTypeToString[cardType])
              : (_cards.cardShown[cardType])

                  /// if our card was chosen once
                  ? TarrotCard(
                      mode: TarrotCardMode.WAS_CHOSEN,
                      icon: cardTypeToString[cardType])

                  /// if our card was not clicked at all
                  : TarrotCard(
                      mode: TarrotCardMode.INTACT,
                      icon: cardTypeToString[cardType]),
        ),
      );
}
