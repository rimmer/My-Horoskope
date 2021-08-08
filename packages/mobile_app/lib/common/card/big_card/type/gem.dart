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
            : Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(
                  "assets/gem/$gemName",
                ),
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
              ),
              Text(
                localeText.gemName[gemName],
                style: AppTextStyle.cardText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
