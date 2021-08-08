import 'package:flutter/material.dart';
import 'package:my_prophet/common/popup_deprecated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:text/text.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'gradient_flatbutton.dart';

class TitleWithDescription extends StatefulWidget {
  final String title;
  final String notation;
  final EdgeInsetsGeometry padding;

  const TitleWithDescription({
    @required this.title,
    Icon icon,
    @required this.notation,
    @required this.padding,
  });

  @override
  _TitleWithDescriptionState createState() => _TitleWithDescriptionState();
}

class _TitleWithDescriptionState extends State<TitleWithDescription> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showOverCurrentScreen(
          context: context,
          child: SimpleTransperentScreen(
            title: widget.title,
            body: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Text(
                widget.notation,
                style: AppTextStyle.normalText,
              ),
            ),
            actions: <Widget>[
              GradientFlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  localeText.understood.toUpperCase(),
                  style: AppTextStyle.gradientButton,
                ),
                padding: EdgeInsets.only(
                  top: 11,
                  bottom: 11,
                  left: 20,
                  right: 15,
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    AppColors.accentDark,
                    AppColors.accent,
                  ],
                ),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentDark,
                    offset: Offset(-1.0, 2.0),
                    blurRadius: 16,
                  )
                ],
              ),
              SizedBox(
                width: 20.0,
              )
            ],
          ),
        );
      },
      child: Padding(
        padding: widget.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTextStyle.titleDescription,
            ),
            SvgPicture.asset("assets/widget/title_info.svg"),
          ],
        ),
      ),
    );
  }
}
