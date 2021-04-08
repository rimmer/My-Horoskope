part of '../screen.dart';

extension DailyScreenCardsMethods on _DailyScreenState {
  ListView cards() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: (sp.cards.currentCardIsNan)
              ? BigCardPlaceholder()
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
                        _chooseTreeBig();
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
                        _chooseCoinBig();
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
                        _chooseStarBig();
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
                        _chooseSwordBig();
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
                        _chooseCupBig();
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
                        _chooseStarBig();
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
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.treeChoise = true;
      sp.cards.treeWasChossen = true;
      sp.cards.coinChoise = false;
      sp.cards.starChoise = false;
      sp.cards.swordChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseTreeBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.MOODLET),
      );
      sp.cards.currentCardIsNan = false;
    });
  }

  _chooseCoin() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.coinChoise = true;
      sp.cards.coinWasChossen = true;
      sp.cards.treeChoise = false;
      sp.cards.starChoise = false;
      sp.cards.swordChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseCoinBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTUITION),
      );
      sp.cards.currentCardIsNan = false;
    });
  }

  _chooseStar() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.starChoise = true;
      sp.cards.starWasChossen = true;
      sp.cards.treeChoise = false;
      sp.cards.coinChoise = false;
      sp.cards.swordChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseStarBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.LUCK),
      );
      sp.cards.currentCardIsNan = false;
    });
  }

  _chooseSword() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.swordChoise = true;
      sp.cards.swordWasChossen = true;
      sp.cards.treeChoise = false;
      sp.cards.coinChoise = false;
      sp.cards.starChoise = false;
      sp.cards.cupChoise = false;
    });
  }

  _chooseSwordBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.AMBITION),
      );
      sp.cards.currentCardIsNan = false;
    });
  }

  _chooseCup() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.cupChoise = true;
      sp.cards.cupWasChossen = true;
      sp.cards.treeChoise = false;
      sp.cards.coinChoise = false;
      sp.cards.starChoise = false;
      sp.cards.swordChoise = false;
    });
  }

  _chooseCupBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cards.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTERNAL_STRENGTH),
      );
      sp.cards.currentCardIsNan = false;
    });
  }
}
