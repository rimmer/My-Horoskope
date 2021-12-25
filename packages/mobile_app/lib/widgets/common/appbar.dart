import 'package:flutter/material.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'package:my_horoskope/theme/app_colors.dart';

const APPBAR_HEIGHT = 56.0;
const APPBAR_ICON_SIZE = 24.0;
const APPBAR_BETWEEN_ICON_TEXT = 16.0;

class MyProphetAppBar extends StatelessWidget {
  final double width;
  final String label;
  final Function onTap;

  const MyProphetAppBar({@required this.width, @required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.appBarBackground, boxShadow: [
        BoxShadow(
          color: AppColors.calendarShadow.withOpacity(0.9),
          spreadRadius: 4,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ]),
      height: APPBAR_HEIGHT,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Flexible(child: SizedBox(width: APPBAR_ICON_SIZE / 3)),
          Flexible(
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColors.textDisabled,
                size: APPBAR_ICON_SIZE,
              ),
              onPressed: onTap,
            ),
          ),
          const Flexible(child: SizedBox(width: APPBAR_BETWEEN_ICON_TEXT)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              label,
              style: AppTextStyle.appbar,
            ),
          ),
        ],
      ),
    );
  }
}
