import 'package:base/prophecy/entity/prophecy.dart';
import 'package:flutter/material.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'package:my_horoskope/widgets/card/big_card/type/card_carousel.dart';
import 'package:my_horoskope/logic/cards/prediction.dart';

class CardTypeProphecy extends StatelessWidget {
  const CardTypeProphecy();

  @override
  Widget build(BuildContext context) {
    final predictionTextByType = Prediction.of(context).prediction;

    final String root = predictionTextByType(type: ProphecyType.ROOT);
    final String sacral = predictionTextByType(type: ProphecyType.SACRAL);
    final String solar = predictionTextByType(type: ProphecyType.SOLAR);
    final String heart = predictionTextByType(type: ProphecyType.HEART);
    final String throat = predictionTextByType(type: ProphecyType.THROAT);

    return CardCarousel(
      children: [
        if (Prediction.of(context).toShow.moodlet) _ProphecyItem(prophecyText: root),
        if (Prediction.of(context).toShow.luck) _ProphecyItem(prophecyText: sacral),
        if (Prediction.of(context).toShow.ambition) _ProphecyItem(prophecyText: solar),
        if (Prediction.of(context).toShow.internalStrength) _ProphecyItem(prophecyText: heart),
        if (Prediction.of(context).toShow.intuition) _ProphecyItem(prophecyText: throat),
      ],
    );
  }
}

class _ProphecyItem extends StatelessWidget {
  const _ProphecyItem({@required this.prophecyText});
  final String prophecyText;

  @override
  Widget build(BuildContext context) {
    return Text(
      prophecyText,
      style: AppTextStyle.cardText,
      textAlign: TextAlign.start,
    );
  }
}
