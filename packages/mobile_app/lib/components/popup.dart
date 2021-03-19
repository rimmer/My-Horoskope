import 'package:flutter/material.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:my_prophet/theme/app_text_style.dart';

Future<void> showOverCurrentScreen({
  @required BuildContext context,
  @required Widget child,
}) =>
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        child: child,
        insetPadding: EdgeInsets.all(0),
      ),
    );

class SimpleTransperentScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final double height;
  final double width;
  final List<Widget> actions;
  const SimpleTransperentScreen({
    Key key,
    this.title,
    @required this.body,
    @required this.height,
    @required this.width,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      width: width,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: height,
          width: width,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              (title != null)
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      height: 44,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 20),
                          Text(title, style: AppTextStyle.popupTitle),
                        ],
                      ),
                    )
                  : SizedBox(),
              Container(
                width: width,
                child: body,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: actions,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
