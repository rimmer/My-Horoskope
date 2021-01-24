import 'package:flutter/material.dart';

Row gradientBorderButton({
  @required Widget child,
  @required Gradient gradient,
  @required Color background,
  @required EdgeInsetsGeometry borderAsPadding,
  @required EdgeInsetsGeometry internalPadding,
  @required BorderRadiusGeometry borderRadius,
  @required Function onPressed,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      FlatButton(
        onPressed: onPressed,
        child: Container(
          padding: borderAsPadding,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: borderRadius,
          ),
          child: Container(
            padding: internalPadding,
            decoration: BoxDecoration(
              color: background,
              borderRadius: borderRadius,
            ),
            child: Center(child: child),
          ),
        ),
      ),
    ],
  );
}
