import 'common.dart';

class PredictionCardPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: StaticAsset.rust["card_placeholder"],
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          localeText.clarifyForecast,
          style: AppTextStyle.predictionCardText,
        ),
      ),
    );
  }
}
