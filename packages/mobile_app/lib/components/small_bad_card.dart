import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_assets.dart';

const _height = 100.0;
const _width = 64.0;

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
  bool _showFront = true;
  bool _cardNotChanged = true;

  @override
  void initState() {
    _showFront = !_showFront;
    _cardRotation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
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
      _showFront = !_showFront;
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
            child: StaticAsset.svg["light_${widget.icon}"],
          ),
        );
      },
    );
  }
}
