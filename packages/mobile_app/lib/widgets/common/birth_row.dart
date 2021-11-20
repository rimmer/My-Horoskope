import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_horoskope/logic/daily_screen/user_details_for_daily_screen_logic.dart';
import 'package:my_horoskope/theme/app_text_style.dart';

class BirthRow extends StatelessWidget {
  const BirthRow({@required this.info});
  final BirthRowInfo info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset("assets/icons/${info.astroSign}.svg"),
        Text(" ${info.birthDate.day}.${info.birthDate.month}.${info.birthDate.year} ", style: AppTextStyle.normalText),
      ],
    );
  }
}
