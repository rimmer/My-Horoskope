import 'package:flutter/material.dart';
import 'package:my_horoskope/screens/daily/foundation/popup_stack.dart';

class DailyScreen extends StatelessWidget {
  const DailyScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const PopupStackForDailyScreen(),
      );
}
