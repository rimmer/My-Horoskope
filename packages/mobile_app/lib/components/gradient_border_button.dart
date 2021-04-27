import 'package:flutter/material.dart';

class GradientBorderButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final Color background;
  final EdgeInsetsGeometry borderAsPadding;
  final EdgeInsetsGeometry internalPadding;
  final BorderRadiusGeometry borderRadius;
  final Function onPressed;

  const GradientBorderButton({
    @required this.child,
    @required this.gradient,
    @required this.background,
    @required this.borderAsPadding,
    @required this.internalPadding,
    @required this.borderRadius,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
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
}
