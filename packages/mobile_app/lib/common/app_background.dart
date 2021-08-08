import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: const AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
