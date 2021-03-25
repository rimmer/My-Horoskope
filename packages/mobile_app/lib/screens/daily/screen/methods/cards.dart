part of '../screen.dart';

extension DailyScreenCardsMethods on _DailyScreenState {
  ListView cards() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: [
        TitleWithDescription(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16.0,
          ),
          title: localeText.todayAdvice.capitalize(),
          notation: localeText.todayAdviceHint,
        ),
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
            GestureDetector(
                onTap: () {
                  // ignore: invalid_use_of_protected_member
                  setState(() {
                    dat.treeChoise = true;
                    dat.treeWasChossen = true;
                    dat.coinChoise = false;
                    dat.starChoise = false;
                    dat.swordChoise = false;
                    dat.cupChoise = false;
                    dat.animationCardFadeController
                      ..reset()
                      ..forward();
                    dat.currentCard = BigBadCard(
                      text: getPrediction(type: ProphecyType.MOODLET),
                    );
                  });
                },
                child: (dat.treeChoise) ? SmallBadCard() : _card()),
            GestureDetector(
                onTap: () {
                  // ignore: invalid_use_of_protected_member
                  setState(() {
                    dat.coinChoise = true;
                    dat.coinWasChossen = true;
                    dat.treeChoise = false;
                    dat.starChoise = false;
                    dat.swordChoise = false;
                    dat.cupChoise = false;
                    dat.animationCardFadeController
                      ..reset()
                      ..forward();
                    dat.currentCard = BigBadCard(
                      text: getPrediction(type: ProphecyType.INTUITION),
                    );
                  });
                },
                child: (dat.coinChoise) ? SmallBadCard() : _card()),
            GestureDetector(
                onTap: () {
                  // ignore: invalid_use_of_protected_member
                  setState(() {
                    dat.starChoise = true;
                    dat.starWasChossen = true;
                    dat.treeChoise = false;
                    dat.coinChoise = false;
                    dat.swordChoise = false;
                    dat.cupChoise = false;
                    dat.animationCardFadeController
                      ..reset()
                      ..forward();
                    dat.currentCard = BigBadCard(
                      text: getPrediction(type: ProphecyType.LUCK),
                    );
                  });
                },
                child: (dat.starChoise) ? SmallBadCard() : _card()),
            GestureDetector(
                onTap: () {
                  // ignore: invalid_use_of_protected_member
                  setState(() {
                    dat.swordChoise = true;
                    dat.swordWasChossen = true;
                    dat.treeChoise = false;
                    dat.coinChoise = false;
                    dat.starChoise = false;
                    dat.cupChoise = false;
                    dat.animationCardFadeController
                      ..reset()
                      ..forward();
                    dat.currentCard = BigBadCard(
                      text: getPrediction(type: ProphecyType.AMBITION),
                    );
                  });
                },
                child: (dat.swordChoise) ? SmallBadCard() : _card()),
            GestureDetector(
                onTap: () {
                  // ignore: invalid_use_of_protected_member
                  setState(() {
                    dat.cupChoise = true;
                    dat.cupWasChossen = true;
                    dat.treeChoise = false;
                    dat.coinChoise = false;
                    dat.starChoise = false;
                    dat.swordChoise = false;
                    dat.animationCardFadeController
                      ..reset()
                      ..forward();
                    dat.currentCard = BigBadCard(
                      text: getPrediction(type: ProphecyType.INTERNAL_STRENGTH),
                    );
                  });
                },
                child: (dat.cupChoise) ? SmallBadCard() : _card()),
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
          height: 89,
          width: 52,
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/widget/card.svg",
                height: 89,
                width: 52,
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/icons/$icon.svg",
                  color: Colors.white,
                  height: 32.0,
                  width: 32.0,
                ),
              ),
            ],
          ),
        ),
      );
}
