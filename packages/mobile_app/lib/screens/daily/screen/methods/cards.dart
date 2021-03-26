part of '../screen.dart';

extension DailyScreenCardsMethods on _DailyScreenState {
  ListView cards() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        (dat.currentCard != null)
            ? Center(
                child: AnimatedBuilder(
                    animation: dat.animationCardFadeController,
                    builder: (context, child) => FadeTransition(
                          opacity: dat.animationCardFade,
                          child: child,
                        ),
                    child: dat.currentCard))
            : SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //

            (toShow.moodlet)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5),
                    child: GestureDetector(
                      onTap: () {
                        if (dat.treeWasChossen ||
                            dat.coinWasChossen ||
                            dat.starWasChossen ||
                            dat.swordWasChossen ||
                            dat.cupWasChossen) {
                          _chooseTree();
                          dat.animationCardFadeController
                              .reverse()
                              .whenCompleteOrCancel(() {
                            _chooseTreeBig();
                          });
                        } else {
                          _chooseTree();
                          _chooseTreeBig();
                        }
                      },
                      child: (dat.treeChoise)
                          ? SmallBadCard(icon: "tree")
                          : (dat.treeWasChossen)
                              ? StaticAsset.svg["light_tree"]
                              : StaticAsset.svg["dark_tree"],
                    ),
                  )
                : SizedBox(),

            //

            (toShow.intuition)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5),
                    child: GestureDetector(
                      onTap: () {
                        if (dat.treeWasChossen ||
                            dat.coinWasChossen ||
                            dat.starWasChossen ||
                            dat.swordWasChossen ||
                            dat.cupWasChossen) {
                          _chooseCoin();
                          dat.animationCardFadeController
                              .reverse()
                              .whenCompleteOrCancel(() {
                            _chooseCoinBig();
                          });
                        } else {
                          _chooseCoin();
                          _chooseCoinBig();
                        }
                      },
                      child: (dat.coinChoise)
                          ? SmallBadCard(icon: "coins")
                          : (dat.coinWasChossen)
                              ? StaticAsset.svg["light_coins"]
                              : StaticAsset.svg["dark_coins"],
                    ),
                  )
                : SizedBox(),

            //

            (toShow.luck)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5),
                    child: GestureDetector(
                      onTap: () {
                        if (dat.treeWasChossen ||
                            dat.coinWasChossen ||
                            dat.starWasChossen ||
                            dat.swordWasChossen ||
                            dat.cupWasChossen) {
                          _chooseStar();
                          dat.animationCardFadeController
                              .reverse()
                              .whenCompleteOrCancel(() {
                            _chooseStarBig();
                          });
                        } else {
                          _chooseStar();
                          _chooseStarBig();
                        }
                      },
                      child: (dat.starChoise)
                          ? SmallBadCard(icon: "star")
                          : (dat.starWasChossen)
                              ? StaticAsset.svg["light_star"]
                              : StaticAsset.svg["dark_star"],
                    ),
                  )
                : SizedBox(),

            //

            (toShow.ambition)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5),
                    child: GestureDetector(
                      onTap: () {
                        if (dat.treeWasChossen ||
                            dat.coinWasChossen ||
                            dat.starWasChossen ||
                            dat.swordWasChossen ||
                            dat.cupWasChossen) {
                          _chooseSword();
                          dat.animationCardFadeController
                              .reverse()
                              .whenCompleteOrCancel(() {
                            _chooseSwordBig();
                          });
                        } else {
                          _chooseSword();
                          _chooseSwordBig();
                        }
                      },
                      child: (dat.swordChoise)
                          ? SmallBadCard(icon: "sword")
                          : (dat.swordWasChossen)
                              ? StaticAsset.svg["light_sword"]
                              : StaticAsset.svg["dark_sword"],
                    ),
                  )
                : SizedBox(),

            //

            (toShow.internalStrength)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5),
                    child: GestureDetector(
                      onTap: () {
                        if (dat.treeWasChossen ||
                            dat.coinWasChossen ||
                            dat.starWasChossen ||
                            dat.swordWasChossen ||
                            dat.cupWasChossen) {
                          _chooseCup();
                          dat.animationCardFadeController
                              .reverse()
                              .whenCompleteOrCancel(() {
                            _chooseCupBig();
                          });
                        } else {
                          _chooseCup();
                          _chooseCupBig();
                        }
                      },
                      child: (dat.cupChoise)
                          ? SmallBadCard(icon: "cup")
                          : (dat.cupWasChossen)
                              ? StaticAsset.svg["light_cup"]
                              : StaticAsset.svg["dark_cup"],
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
                    padding: EdgeInsets.symmetric(horizontal: 3.5),
                    child: GestureDetector(
                      onTap: () {
                        if (dat.treeWasChossen ||
                            dat.coinWasChossen ||
                            dat.starWasChossen ||
                            dat.swordWasChossen ||
                            dat.cupWasChossen) {
                          _chooseStar();
                          dat.animationCardFadeController
                              .reverse()
                              .whenCompleteOrCancel(() {
                            _chooseStarBig();
                          });
                        } else {
                          _chooseStar();
                          _chooseStarBig();
                        }
                      },
                      child: (dat.starChoise)
                          ? SmallBadCard(icon: "star")
                          : (dat.starWasChossen)
                              ? StaticAsset.svg["light_star"]
                              : StaticAsset.svg["dark_star"],
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
      dat.treeChoise = true;
      dat.treeWasChossen = true;
      dat.coinChoise = false;
      dat.starChoise = false;
      dat.swordChoise = false;
      dat.cupChoise = false;
    });
  }

  _chooseTreeBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.MOODLET),
      );
      dat.animationCardFadeController..forward();
    });
  }

  _chooseCoin() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.coinChoise = true;
      dat.coinWasChossen = true;
      dat.treeChoise = false;
      dat.starChoise = false;
      dat.swordChoise = false;
      dat.cupChoise = false;
    });
  }

  _chooseCoinBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTUITION),
      );
      dat.animationCardFadeController..forward();
    });
  }

  _chooseStar() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.starChoise = true;
      dat.starWasChossen = true;
      dat.treeChoise = false;
      dat.coinChoise = false;
      dat.swordChoise = false;
      dat.cupChoise = false;
    });
  }

  _chooseStarBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.LUCK),
      );
      dat.animationCardFadeController..forward();
    });
  }

  _chooseSword() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.swordChoise = true;
      dat.swordWasChossen = true;
      dat.treeChoise = false;
      dat.coinChoise = false;
      dat.starChoise = false;
      dat.cupChoise = false;
    });
  }

  _chooseSwordBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.AMBITION),
      );
      dat.animationCardFadeController..forward();
    });
  }

  _chooseCup() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.cupChoise = true;
      dat.cupWasChossen = true;
      dat.treeChoise = false;
      dat.coinChoise = false;
      dat.starChoise = false;
      dat.swordChoise = false;
    });
  }

  _chooseCupBig() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTERNAL_STRENGTH),
      );
      dat.animationCardFadeController..forward();
    });
  }
}
