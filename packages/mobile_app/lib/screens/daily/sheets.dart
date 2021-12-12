import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_logic.dart';
import 'package:my_horoskope/screens/daily/constants.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_button.dart';

class SheetsList extends StatelessWidget {
  const SheetsList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(
      [
        AddAmbianceButton(
          onTap: AmbiancePopupsLogic.of(context).focusAmbianceAdd,
        ),
        const SizedBox(
          height: SPACE_AFTER_AMBIANCE,
        ),
      ],
    ));
  }
}
