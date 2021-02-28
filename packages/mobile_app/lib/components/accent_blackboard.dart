import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'package:my_prophet/theme/app_colors.dart';

class AccentBlackboard extends StatefulWidget {
  final Widget title;
  final Stream<String> textStream;
  final double spaceBetweenTitleAndText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  AccentBlackboard({
    @required this.title,
    @required this.textStream,
    this.spaceBetweenTitleAndText = 14.0,
    this.padding,
    this.margin,
  });
  @override
  _AccentBlackboardState createState() => _AccentBlackboardState();
}

class _AccentBlackboardState extends State<AccentBlackboard> {
  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.calendarDateSelected.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: <Color>[
              AppColors.accentDark,
              AppColors.accent,
            ],
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            widget.title,
            SizedBox(
              height: widget.spaceBetweenTitleAndText,
            ),
            //
            StreamBuilder<String>(
              initialData: "........",
              stream: widget.textStream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                //
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  return _text(snapshot.data);
                }
                //
                return _text("........");
              },
            ),
          ],
        ),
      );
}

Text _text(String text) => Text(
      text,
      style: AppTextStyle.accentBlackBoardText,
    );
