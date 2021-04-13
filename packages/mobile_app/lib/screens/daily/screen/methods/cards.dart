part of '../screen.dart';

extension DailyScreenCardsMethods on _DailyScreenState {
  ListView cards() {
    sp.ads.cardsShown = sp.cards.numberOfCardsChosen();

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: sp.cards.currentCardIsNan
              ? BigCardPlaceholder()
              : sp.ads.toBuild
                  ? BigCardAds()
                  : sp.cards.currentCard,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //

            (toShow.moodlet)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: GestureDetector(
                      onTap: () {
                        _chooseTree();
                      },
                      child: (sp.cards.treeChoise)
                          ? SmallCard(mode: 2, icon: "tree")
                          : (sp.cards.treeWasChossen)
                              ? SmallCard(mode: 1, icon: "tree")
                              : SmallCard(mode: 0, icon: "tree"),
                    ),
                  )
                : SizedBox(),

            //

            (toShow.intuition)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: GestureDetector(
                      onTap: () {
                        _chooseCoin();
                      },
                      child: (sp.cards.coinChoise)
                          ? SmallCard(mode: 2, icon: "coins")
                          : (sp.cards.coinWasChossen)
                              ? SmallCard(mode: 1, icon: "coins")
                              : SmallCard(mode: 0, icon: "coins"),
                    ),
                  )
                : SizedBox(),

            //

            (toShow.luck)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: GestureDetector(
                      onTap: () {
                        _chooseStar();
                      },
                      child: (sp.cards.starChoise)
                          ? SmallCard(mode: 2, icon: "star")
                          : (sp.cards.starWasChossen)
                              ? SmallCard(mode: 1, icon: "star")
                              : SmallCard(mode: 0, icon: "star"),
                    ),
                  )
                : SizedBox(),

            //

            (toShow.ambition)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: GestureDetector(
                      onTap: () {
                        _chooseSword();
                      },
                      child: (sp.cards.swordChoise)
                          ? SmallCard(mode: 2, icon: "sword")
                          : (sp.cards.swordWasChossen)
                              ? SmallCard(mode: 1, icon: "sword")
                              : SmallCard(mode: 0, icon: "sword"),
                    ),
                  )
                : SizedBox(),

            //

            (toShow.internalStrength)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: GestureDetector(
                      onTap: () {
                        _chooseCup();
                      },
                      child: (sp.cards.cupChoise)
                          ? SmallCard(mode: 2, icon: "cup")
                          : (sp.cards.cupWasChossen)
                              ? SmallCard(mode: 1, icon: "cup")
                              : SmallCard(mode: 0, icon: "cup"),
                    ),
                  )
                : SizedBox(),

            //

            (toShow.internalStrength == false &&
                    toShow.moodlet == false &&
                    toShow.ambition == false &&
                    toShow.intuition == false &&
                    toShow.luck == false)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: GestureDetector(
                      onTap: () {
                        _chooseStar();
                      },
                      child: (sp.cards.starChoise)
                          ? SmallCard(mode: 2, icon: "star")
                          : (sp.cards.starWasChossen)
                              ? SmallCard(mode: 1, icon: "star")
                              : SmallCard(mode: 0, icon: "star"),
                    ),
                  )
                : SizedBox()

            //
          ],
        ),
      ],
    );
  }

  _chooseTree() {
    if (sp.cards.treeWasChossen == false && sp.adsAreDisabled == false) {
      sp.ads.toBuild = true;
      sp.ads.whenWatched = _chooseTree;
    } else {
      sp.ads.toBuild = false;
      sp.cards.treeChoise = true;
      sp.cards.treeWasChossen = true;
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.MOODLET),
      );
    }
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCardIsNan = false;
      sp.cards.coinChoise = false;
      sp.cards.starChoise = false;
      sp.cards.swordChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseCoin() {
    if (sp.cards.coinWasChossen == false && sp.adsAreDisabled == false) {
      sp.ads.toBuild = true;
      sp.ads.whenWatched = _chooseCoin;
    } else {
      sp.ads.toBuild = false;
      sp.cards.coinChoise = true;
      sp.cards.coinWasChossen = true;
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTUITION),
      );
    }
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCardIsNan = false;
      sp.cards.treeChoise = false;
      sp.cards.starChoise = false;
      sp.cards.swordChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseStar() {
    if (sp.cards.starWasChossen == false && sp.adsAreDisabled == false) {
      sp.ads.toBuild = true;
      sp.ads.whenWatched = _chooseStar;
    } else {
      sp.ads.toBuild = false;
      sp.cards.starChoise = true;
      sp.cards.starWasChossen = true;
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.LUCK),
      );
    }
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCardIsNan = false;
      sp.cards.treeChoise = false;
      sp.cards.coinChoise = false;
      sp.cards.swordChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseSword() {
    if (sp.cards.swordWasChossen == false && sp.adsAreDisabled == false) {
      sp.ads.toBuild = true;
      sp.ads.whenWatched = _chooseSword;
    } else {
      sp.ads.toBuild = false;
      sp.cards.swordChoise = true;
      sp.cards.swordWasChossen = true;
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.AMBITION),
      );
    }
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCardIsNan = false;
      sp.cards.treeChoise = false;
      sp.cards.coinChoise = false;
      sp.cards.starChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseCup() {
    if (sp.cards.cupWasChossen == false && sp.adsAreDisabled == false) {
      sp.ads.toBuild = true;
      sp.ads.whenWatched = _chooseCup;
    } else {
      sp.ads.toBuild = false;
      sp.cards.cupChoise = true;
      sp.cards.cupWasChossen = true;
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTERNAL_STRENGTH),
      );
      sp.cards.currentCardIsNan = false;
    }
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.treeChoise = false;
      sp.cards.coinChoise = false;
      sp.cards.starChoise = false;
      sp.cards.swordChoise = false;
    });
  }
}
