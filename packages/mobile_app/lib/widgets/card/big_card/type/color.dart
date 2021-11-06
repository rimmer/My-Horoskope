import '../common.dart';

class CardTypeColor extends StatelessWidget {
  final int first;
  final int second;
  final int third;

  const CardTypeColor({
    @required this.first,
    @required this.second,
    @required this.third,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundCircleColor = Colors.white;
    final firstCircleColor = Color(first);
    final secondCircleColor = Color(second);
    final thirdCircleColor = Color(third);

    final urClrTdy = localeText.yourColorsForToday.split(" ");

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 164,
          child: CustomPaint(
            painter: AstrologicColorCirclesPainter(
              backgroundCircleColor: backgroundCircleColor,
              firstCircleColor: firstCircleColor,
              secondCircleColor: secondCircleColor,
              thirdCircleColor: thirdCircleColor,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${urClrTdy[0]} ${urClrTdy[1]}",
              style: AppTextStyle.cardText,
              textAlign: TextAlign.center,
            ),
            Text(
              "${urClrTdy[2]} ${urClrTdy[3]}",
              style: AppTextStyle.cardText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

class AstrologicColorCirclesPainter extends CustomPainter {
  final Color backgroundCircleColor;
  final Color firstCircleColor;
  final Color secondCircleColor;
  final Color thirdCircleColor;

  AstrologicColorCirclesPainter({
    @required this.backgroundCircleColor,
    @required this.firstCircleColor,
    @required this.secondCircleColor,
    @required this.thirdCircleColor,
  });

  void paint(Canvas canvas, Size size) {
    //
    final backgroundCircle = Paint()
      ..color = backgroundCircleColor
      ..style = PaintingStyle.fill;

    final circleFirst = Paint()
      ..color = firstCircleColor
      ..style = PaintingStyle.fill;

    final circleSecond = Paint()
      ..color = secondCircleColor
      ..style = PaintingStyle.fill;

    final circleThird = Paint()
      ..color = thirdCircleColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(105, 70), 31, backgroundCircle);
    canvas.drawCircle(Offset(105, 70), 30, circleFirst);
    canvas.drawCircle(Offset(55, 70), 31, backgroundCircle);
    canvas.drawCircle(Offset(55, 70), 30, circleSecond);
    canvas.drawCircle(Offset(80, 30), 31, backgroundCircle);
    canvas.drawCircle(Offset(80, 30), 30, circleThird);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
