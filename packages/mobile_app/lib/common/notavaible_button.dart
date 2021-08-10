import 'package:flutter/material.dart';
import 'package:my_horoskope/common/popup_deprecated.dart';
import 'package:my_horoskope/theme/app_colors.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'gradient_flatbutton.dart';

class NotAvaibleInfo extends StatefulWidget {
  final Widget child;
  final String title;
  final String desc;
  final String button;

  NotAvaibleInfo(
      {@required this.child,
      @required this.title,
      @required this.desc,
      @required this.button,
      Key key})
      : super(key: key);

  @override
  _NotAvaibleInfoState createState() => _NotAvaibleInfoState();
}

class _NotAvaibleInfoState extends State<NotAvaibleInfo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showOverCurrentScreen(
          context: context,
          child: SimpleTransperentScreen(
            title: widget.title,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  widget.desc,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              Expanded(
                child: GradientFlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    widget.button,
                    style: AppTextStyle.gradientButton,
                  ),
                  padding: const EdgeInsets.only(
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
              const SizedBox(width: 20),
            ],
          ),
        );
      },
      child: widget.child ??
          Container(
            padding: const EdgeInsets.only(
              left: 32,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            child: const Icon(
              Icons.error,
              size: 14,
              color: AppColors.textSecondary,
            ),
          ),
    );
  }
}
