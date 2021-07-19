import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:text/text.dart';

class ProphecyRecord extends StatelessWidget {
  final ProphecyEntity prophecy;

  const ProphecyRecord({
    @required this.prophecy,
  });

  @override
  Widget build(BuildContext context) {
    //

    final value = prophecy.value ?? 0.0;
    var valueNewFormula = (value - 50.0);
    final isNegative = valueNewFormula < 0.0;
    if (isNegative) valueNewFormula *= -1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 2.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              localeText.prophecyId[prophecy.id.toStr],
              style: AppTextStyle.prophecyLabel,
            ),
          ),
          SizedBox(
            height: 8.0,
            width: 8.0,
            child: CustomPaint(
              painter: _TrianglePainter(isNegative: isNegative),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "${valueNewFormula.toStringAsFixed(0)}%",
            style: AppTextStyle.prophecyPercent,
          )
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final bool isNegative;
  const _TrianglePainter({@required this.isNegative});

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
