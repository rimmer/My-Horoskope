import '../common.dart';

class CardTypeTarrot extends StatelessWidget {
  final String tarrotName;

  const CardTypeTarrot({@required this.tarrotName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage("assets/tarrot/$tarrotName"),
          height: 170.0,
          width: 170.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localeText.yourTarrotCardForToday,
              style: AppTextStyle.normalText,
            ),
            Text(
              localeText.tarrotCardName[tarrotName],
              style: AppTextStyle.cardText,
            ),
          ],
        ),
      ],
    );
  }
}
