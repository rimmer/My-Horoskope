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
          height: 150.0,
          width: 150.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Column(
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
        ),
      ],
    );
  }
}
