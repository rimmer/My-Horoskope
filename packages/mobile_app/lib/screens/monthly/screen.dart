import 'package:flutter/material.dart';
import 'package:app/components/prophecy_records.dart';

class MonthlyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Records(),
      ),
    );
  }
}