import 'common.dart';

class PredictionCardPlaceholder extends StatelessWidget {
  final String customText;

  const PredictionCardPlaceholder({this.customText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
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
          customText ?? localeText.clarifyForecast,
          style: AppTextStyle.predictionCardText,
        ),
      ),
    );
  }
}
