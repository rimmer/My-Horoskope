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
                  : sp.adsAreDisabled == false && _cards.toBuildAds

                      /// we build our ads card
                      ? BigCardAds(
                          action: () {
                            // ignore: invalid_use_of_protected_member
                            setState(() {
                              /// here we show our ads
                              //
                              /// here we make needed stuff after ads watched
                              _cards.whenAdsWatched();
                            });
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
          child: (_cards.choise == cardType)

              /// if current card is choosed show mode 2
              ? SmallCard(mode: 2, icon: cardTypeToString[cardType])
              : (_cards.cardShown[cardType])

                  /// if our card was chosen previously show mode 1
                  ? SmallCard(mode: 1, icon: cardTypeToString[cardType])

                  /// if our card was not clicked at all show mode 0
                  : SmallCard(mode: 0, icon: cardTypeToString[cardType]),
        ),
      );
}
