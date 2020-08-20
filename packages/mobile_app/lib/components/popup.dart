import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';

Future<void> showOverCurrentScreen({
  @required BuildContext context,
  @required Widget child,
}) =>
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: SingleChildScrollView(child: child),
      ),
    );

class SimpleTransperentScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final double heightFactor;
  final double widthFactor;
  final List<Widget> actions;
  const SimpleTransperentScreen({
    Key key,
    this.title,
    @required this.body,
    this.heightFactor = 0.4,
    this.widthFactor = 0.8,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),

      /// ПРАЦЮЄ
      height: screenHeight * heightFactor,

      /// НЕ ПРАЦЮЄ
      width: screenWidth * widthFactor,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  width: screenWidth * widthFactor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 20),
                      Text(title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                )
              : SizedBox(),
          Container(
            width: screenWidth * widthFactor,
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
    );
  }
}
