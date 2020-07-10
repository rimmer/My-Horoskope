import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/theme/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Loading(),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SpinKitFadingCircle(
          color: AppColors.accent,
          size: 128,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "My Prophet is loading.",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
