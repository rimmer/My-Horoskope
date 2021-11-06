import '../common.dart';

class CardTypeGem extends StatelessWidget {
  final String gemName;

  const CardTypeGem({@required this.gemName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        gemName.contains(".png")
            ? Image(
                image: AssetImage("assets/gem/$gemName"),
              )
            : SvgPicture.asset(
                "assets/gem/$gemName",
              ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localeText.yourGemForToday,
                style: AppTextStyle.normalText,
                textAlign: TextAlign.center,
              ),
              Text(
                localeText.gemName[gemName],
                style: AppTextStyle.cardText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
