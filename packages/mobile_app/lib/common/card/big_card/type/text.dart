import '../common.dart';

class CardTypeText extends StatelessWidget {
  final String text;

  const CardTypeText({this.text = "I am the card!"});

  @override
  Widget build(BuildContext context) {
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
