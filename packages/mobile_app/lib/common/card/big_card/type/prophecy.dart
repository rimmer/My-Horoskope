import 'package:my_horoskope/logic/cards/prediction_logic.dart';

import '../common.dart';

class CardTypeProphecy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String text = PredictionLogic.of(context).predictionTextCallback();

    return Center(
      child: SingleChildScrollView(
        child: Text(
          text,
          style: AppTextStyle.cardText,
        ),
      ),
    );
  }
}
