import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _height = 95.0;
const _width = 59.0;

class SmallBadCard extends StatefulWidget {
  final String icon;
  SmallBadCard({
    this.icon = "star",
  });

  @override
  _SmallBadCardState createState() => _SmallBadCardState();
}

class _SmallBadCardState extends State<SmallBadCard>
    with SingleTickerProviderStateMixin {
  AnimationController _cardRotation;
  bool _cardNotChanged = true;

  @override
  void initState() {
    _cardRotation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      value: 0,
    );

    super.initState();
  }

  @override
  void dispose() {
    _cardRotation.dispose();
    super.dispose();
  }

  rotate() async {
    await _cardRotation.forward();
    setState(() {
      _cardNotChanged = false;
    });
    await _cardRotation.reverse();
    setState(() {
      _cardNotChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cardNotChanged) rotate();

    return AnimatedBuilder(
      animation: _cardRotation,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.rotationY(_cardRotation.value * pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: _height,
            width: _width,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/card/card_light.svg",
                  height: _height,
                  width: _width,
                ),
                SvgPicture.asset(
                  "assets/card/${widget.icon}_light.svg",
                  height: _height,
                  width: _width,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
