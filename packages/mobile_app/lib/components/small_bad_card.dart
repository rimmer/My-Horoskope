import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_assets.dart';

const _height = 100.0;
const _width = 64.0;

class SmallBadCard extends StatefulWidget {
  final String icon;
  final int mode;
  SmallBadCard({this.icon = "star", @required this.mode});

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
      duration: Duration(milliseconds: 600),
      value: 0.0,
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
    if (_cardNotChanged && widget.mode == 2) rotate();

    return Container(
      height: _height,
      width: _width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _cardRotation,
              builder: (context, child) {
                return Transform(
                    transform: Matrix4.rotationY(_cardRotation.value * pi / 2),
                    alignment: Alignment.center,
                    child: StaticAsset.svg["light_${widget.icon}"]);
              },
            ),
          ),
          (widget.mode == 1)
              ? Align(
                  alignment: Alignment.center,
                  child: StaticAsset.svg["light_${widget.icon}"])
              : SizedBox(),
          (widget.mode == 0)
              ? Align(
                  alignment: Alignment.center,
                  child: StaticAsset.svg["dark_${widget.icon}"])
              : SizedBox(),
        ],
      ),
    );
  }
}
