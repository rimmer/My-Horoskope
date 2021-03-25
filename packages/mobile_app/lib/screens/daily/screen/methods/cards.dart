part of '../screen.dart';

const _cardHeight = 95.7;
const _cardWidth = 59.4;

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
                    animation: dat.animationCardFade,
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
                ? GestureDetector(
                    onTap: () {
                      if (dat.treeWasChossen ||
                          dat.coinWasChossen ||
                          dat.starWasChossen ||
                          dat.swordWasChossen ||
                          dat.cupWasChossen)
                        dat.animationCardFadeController
                            .reverse()
                            .whenCompleteOrCancel(() {
                          _chooseTree();
                        });
                      else
                        _chooseTree();
                    },
                    child: (dat.treeChoise)
                        ? SmallBadCard()
                        : (dat.treeWasChossen)
                            ? _card()
                            : _notUsedCard())
                : SizedBox(),

            //

            (toShow.intuition)
                ? GestureDetector(
                    onTap: () {
                      if (dat.treeWasChossen ||
                          dat.coinWasChossen ||
                          dat.starWasChossen ||
                          dat.swordWasChossen ||
                          dat.cupWasChossen)
                        dat.animationCardFadeController
                            .reverse()
                            .whenCompleteOrCancel(() {
                          _chooseCoin();
                        });
                      else
                        _chooseCoin();
                    },
                    child: (dat.coinChoise)
                        ? SmallBadCard()
                        : (dat.coinWasChossen)
                            ? _card()
                            : _notUsedCard())
                : SizedBox(),

            //

            (toShow.luck)
                ? GestureDetector(
                    onTap: () {
                      if (dat.treeWasChossen ||
                          dat.coinWasChossen ||
                          dat.starWasChossen ||
                          dat.swordWasChossen ||
                          dat.cupWasChossen)
                        dat.animationCardFadeController
                            .reverse()
                            .whenCompleteOrCancel(() {
                          _chooseStar();
                        });
                      else
                        _chooseStar();
                    },
                    child: (dat.starChoise)
                        ? SmallBadCard()
                        : (dat.starWasChossen)
                            ? _card()
                            : _notUsedCard())
                : SizedBox(),

            //

            (toShow.ambition)
                ? GestureDetector(
                    onTap: () {
                      if (dat.treeWasChossen ||
                          dat.coinWasChossen ||
                          dat.starWasChossen ||
                          dat.swordWasChossen ||
                          dat.cupWasChossen)
                        dat.animationCardFadeController
                            .reverse()
                            .whenCompleteOrCancel(() {
                          _chooseSword();
                        });
                      else
                        _chooseSword();
                    },
                    child: (dat.swordChoise)
                        ? SmallBadCard()
                        : (dat.swordWasChossen)
                            ? _card()
                            : _notUsedCard())
                : SizedBox(),

            //

            (toShow.internalStrength)
                ? GestureDetector(
                    onTap: () {
                      if (dat.treeWasChossen ||
                          dat.coinWasChossen ||
                          dat.starWasChossen ||
                          dat.swordWasChossen ||
                          dat.cupWasChossen)
                        dat.animationCardFadeController
                            .reverse()
                            .whenCompleteOrCancel(() {
                          _chooseCup();
                        });
                      else
                        _chooseCup();
                    },
                    child: (dat.cupChoise)
                        ? SmallBadCard()
                        : (dat.cupWasChossen)
                            ? _card()
                            : _notUsedCard())
                : SizedBox(),

            //

            (toShow.internalStrength == false &&
                    toShow.moodlet == false &&
                    toShow.ambition == false &&
                    toShow.intuition == false &&
                    toShow.luck == false)
                ? GestureDetector(
                    onTap: () {
                      if (dat.treeWasChossen ||
                          dat.coinWasChossen ||
                          dat.starWasChossen ||
                          dat.swordWasChossen ||
                          dat.cupWasChossen)
                        dat.animationCardFadeController
                            .reverse()
                            .whenCompleteOrCancel(() {
                          _chooseStar();
                        });
                      else
                        _chooseStar();
                    },
                    child: (dat.starChoise)
                        ? SmallBadCard()
                        : (dat.starWasChossen)
                            ? _card()
                            : _notUsedCard())
                : SizedBox()

            //
          ],
        ),
      ],
    );
  }

  Padding _card({
    String icon = "star",
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.5),
        child: Container(
          height: _cardHeight,
          width: _cardWidth,
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/card/card_light.svg",
                height: _cardHeight,
                width: _cardWidth,
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/card/${icon}_light.svg",
                  height: _cardHeight,
                  width: _cardWidth,
                ),
              ),
            ],
          ),
        ),
      );

  _chooseTree() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      dat.treeChoise = true;
      dat.treeWasChossen = true;
      dat.coinChoise = false;
      dat.starChoise = false;
      dat.swordChoise = false;
      dat.cupChoise = false;
      dat.animationCardFadeController..forward();
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.MOODLET),
      );
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
      dat.animationCardFadeController..forward();
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTUITION),
      );
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
      dat.animationCardFadeController..forward();
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.LUCK),
      );
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
      dat.animationCardFadeController..forward();
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.AMBITION),
      );
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
      dat.animationCardFadeController..forward();
      dat.currentCard = BigCard(
        text: getPrediction(type: ProphecyType.INTERNAL_STRENGTH),
      );
    });
  }

  Padding _notUsedCard({
    String icon = "star",
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.5),
        child: Container(
          height: _cardHeight,
          width: _cardWidth,
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/card/card_dark.svg",
                height: _cardHeight,
                width: _cardWidth,
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/card/${icon}_dark.svg",
                  height: _cardHeight,
                  width: _cardWidth,
                ),
              ),
            ],
          ),
        ),
      );
}
