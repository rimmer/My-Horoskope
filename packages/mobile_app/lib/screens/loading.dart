import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_horoskope/theme/app_colors.dart';

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
      child: const SpinKitPouringHourGlass(color: AppColors.primaryLight),
    );
  }
}
