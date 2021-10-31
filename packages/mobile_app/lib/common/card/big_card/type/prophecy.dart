import 'package:my_horoskope/common/card/big_card/type/card_carousel.dart';
import 'package:my_horoskope/logic/cards/prediction_logic.dart';
import 'package:my_horoskope/screens/daily/index.dart';
import '../common.dart';

class CardTypeProphecy extends StatelessWidget {
  const CardTypeProphecy();

  @override
  Widget build(BuildContext context) {
    final String root = PredictionLogic.of(context).predictionTextCallback(type: ProphecyType.ROOT);
    final String sacral = PredictionLogic.of(context).predictionTextCallback(type: ProphecyType.SACRAL);
    final String solar = PredictionLogic.of(context).predictionTextCallback(type: ProphecyType.SOLAR);
    final String heart = PredictionLogic.of(context).predictionTextCallback(type: ProphecyType.HEART);
    final String throat = PredictionLogic.of(context).predictionTextCallback(type: ProphecyType.THROAT);

    return CardCarousel(
      children: [
        if (PredictionLogic.of(context).toShow.moodlet) _ProphecyItem(prophecyText: root),
        if (PredictionLogic.of(context).toShow.luck) _ProphecyItem(prophecyText: sacral),
        if (PredictionLogic.of(context).toShow.ambition) _ProphecyItem(prophecyText: solar),
        if (PredictionLogic.of(context).toShow.internalStrength) _ProphecyItem(prophecyText: heart),
        if (PredictionLogic.of(context).toShow.intuition) _ProphecyItem(prophecyText: throat),
      ],
    );
  }
}

class _ProphecyItem extends StatelessWidget {
  const _ProphecyItem({@required this.prophecyText});
  final String prophecyText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        prophecyText,
        style: AppTextStyle.cardText,
        textAlign: TextAlign.start,
      ),
    );
  }
}
