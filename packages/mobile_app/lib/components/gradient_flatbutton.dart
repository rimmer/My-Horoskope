import 'package:flutter/material.dart';

class GradientFlatButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Function onPressed;
  final List<BoxShadow> boxShadow;

  const GradientFlatButton({
    Key key,
    @required this.child,
    @required this.gradient,
    this.padding = const EdgeInsets.all(16),
    @required this.borderRadius,
    @required this.onPressed,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
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
}
