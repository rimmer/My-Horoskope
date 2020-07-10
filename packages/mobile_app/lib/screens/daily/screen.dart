import 'package:flutter/material.dart';

import 'package:app/components/prophecy_records.dart';
import 'feelings.dart';

class DailyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Feelings(),
            Flexible(child: Records()),
          ],
        ),
      ),
    );
  }
}
