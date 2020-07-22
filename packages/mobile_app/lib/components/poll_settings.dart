import 'package:algorithm/algorithm.dart';
import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language/language.dart';
import 'package:user_poll/bloc.dart';

class PollSettings extends StatefulWidget {
  final algorithm;
  PollSettings({@required this.algorithm});
  @override
  PollSettingsState createState() => PollSettingsState();
}

class PollSettingsState extends State<PollSettings> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        "assets/icons/gear.svg",
        width: 14,
        height: 14,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class PollSettingsPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
