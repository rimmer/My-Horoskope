import 'package:flutter/material.dart';
import 'package:my_horoskope/theme/app_colors.dart';

class TrianglePainter extends CustomPainter {
  final bool isNegative;
  const TrianglePainter({@required this.isNegative});

  void paint(Canvas canvas, Size size) {
    final paintWithColor =
        isNegative ? AppColors.negativeImpact : AppColors.positiveImpact;

    final style = Paint()
      ..color = paintWithColor
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isNegative) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width / 2, size.height);
      path.close();
    } else {
      path.moveTo(size.width / 2, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.close();
    }

    canvas.drawPath(path, style);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
