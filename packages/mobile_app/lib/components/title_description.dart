import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_prophet/components/popup.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:language/language.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'gradient_flatbutton.dart';

class TitleWithDescription extends StatefulWidget {
  final String title;
  final String notation;
  final double height;
  final double width;

  TitleWithDescription({
    @required this.title,
    Icon icon,
    @required this.notation,
    @required this.height,
    @required this.width,
  });

  @override
  _TitleWithDescriptionState createState() => _TitleWithDescriptionState();
}

class _TitleWithDescriptionState extends State<TitleWithDescription> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.title}:",
          style: AppTextStyle.titleDescription,
        ),
        GestureDetector(
          onTap: () {
            showOverCurrentScreen(
              context: context,
              child: SimpleTransperentScreen(
                height: widget.height,
                width: widget.width,
                title: widget.title,
                body: Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: Center(
                    child: Text(
                      widget.notation,
                      style: AppTextStyle.normalText,
                    ),
                  ),
                ),
                actions: <Widget>[
                  Expanded(
                    child: SizedBox(),
                  ),
                  Flexible(
                    child: gradientFlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        lang.understood.toUpperCase(),
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
                  ),
                  SizedBox(width: 20),
                ],
              ),
            );
          },
          child: SvgPicture.asset("assets/widget/title_info.svg"),
        ),
      ],
    );
  }
}
