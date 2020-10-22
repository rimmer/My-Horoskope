import 'package:flutter/material.dart';

Row gradientFlatButton({
  @required Widget child,
  @required Gradient gradient,
  EdgeInsetsGeometry padding,
  @required BorderRadiusGeometry borderRadius,
  @required Function onPressed,
  List<BoxShadow> boxShadow,
}) {
  padding = padding ?? const EdgeInsets.all(16);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: borderRadius,
              boxShadow: boxShadow ?? []),
          child: Center(child: child),
        ),
      ),
    ],
  );
}
