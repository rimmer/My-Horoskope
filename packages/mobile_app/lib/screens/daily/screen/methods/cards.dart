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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _card(),
            _card(),
            _card(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _card(),
            _card(),
          ],
        ),
      ],
    );
  }
}

Padding _card({String icon = "star"}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        height: 150,
        width: 90,
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/widget/card.svg",
              height: 150,
              width: 90,
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/cards/$icon.svg",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
