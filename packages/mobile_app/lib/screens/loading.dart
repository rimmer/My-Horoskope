import 'package:flutter/material.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: const SafeArea(
        child: const Loading(),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: const SpinKitPouringHourglass(color: AppColors.primaryLight),
    );
  }
}
