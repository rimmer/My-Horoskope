import 'package:flutter/material.dart';
import 'package:my_horoskope/common/triangle_painter.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
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
    final valueNewFormula = (value - 50.0);
    final isNegative = valueNewFormula < 0.0;

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
              painter: TrianglePainter(isNegative: isNegative),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "${value.toStringAsFixed(0)}%",
            style: AppTextStyle.prophecyPercent,
          )
        ],
      ),
    );
  }
}
