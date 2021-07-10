import '../common.dart';

class CardTypeNumber extends StatelessWidget {
  final String numberName;

  const CardTypeNumber({@required this.numberName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/numerology/$numberName",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              localeText.yourNumberForToday,
              style: AppTextStyle.cardText,
            ),
          ),
        ],
      ),
    );
  }
}
