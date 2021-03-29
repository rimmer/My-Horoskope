part of '../screen.dart';

extension DailyScreenCardsMethods on _DailyScreenState {
  ListView cards() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: (sp.currentCardIsNan) ? BigCardPlaceholder() : sp.currentCard,
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
                      child: (sp.treeChoise)
                          ? SmallCard(mode: 2, icon: "tree")
                          : (sp.treeWasChossen)
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
                      child: (sp.coinChoise)
                          ? SmallCard(mode: 2, icon: "coins")
                          : (sp.coinWasChossen)
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
                      child: (sp.starChoise)
                          ? SmallCard(mode: 2, icon: "star")
                          : (sp.starWasChossen)
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
                      child: (sp.swordChoise)
                          ? SmallCard(mode: 2, icon: "sword")
                          : (sp.swordWasChossen)
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
                      child: (sp.cupChoise)
                          ? SmallCard(mode: 2, icon: "cup")
                          : (sp.cupWasChossen)
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
                      child: (sp.starChoise)
                          ? SmallCard(mode: 2, icon: "star")
                          : (sp.starWasChossen)
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
      sp.treeChoise = true;
      sp.treeWasChossen = true;
      sp.coinChoise = false;
      sp.starChoise = false;
      sp.swordChoise = false;
      sp.cupChoise = false;
    });
  }

  _chooseTreeBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.MOODLET),
      );
      sp.currentCardIsNan = false;
    });
  }

  _chooseCoin() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.coinChoise = true;
      sp.coinWasChossen = true;
      sp.treeChoise = false;
      sp.starChoise = false;
      sp.swordChoise = false;
      sp.cupChoise = false;
    });
  }

  _chooseCoinBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTUITION),
      );
      sp.currentCardIsNan = false;
    });
  }

  _chooseStar() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.starChoise = true;
      sp.starWasChossen = true;
      sp.treeChoise = false;
      sp.coinChoise = false;
      sp.swordChoise = false;
      sp.cupChoise = false;
    });
  }

  _chooseStarBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.LUCK),
      );
      sp.currentCardIsNan = false;
    });
  }

  _chooseSword() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.swordChoise = true;
      sp.swordWasChossen = true;
      sp.treeChoise = false;
      sp.coinChoise = false;
      sp.starChoise = false;
      sp.cupChoise = false;
    });
  }

  _chooseSwordBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.AMBITION),
      );
      sp.currentCardIsNan = false;
    });
  }

  _chooseCup() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.cupChoise = true;
      sp.cupWasChossen = true;
      sp.treeChoise = false;
      sp.coinChoise = false;
      sp.starChoise = false;
      sp.swordChoise = false;
    });
  }

  _chooseCupBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      sp.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTERNAL_STRENGTH),
      );
      sp.currentCardIsNan = false;
    });
  }
}
