import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prophet/theme/app_text_style.dart';

const _height = 445.0;
const _width = 260.0;

class BigBadCard extends StatefulWidget {
  final String text;
  final String icon;
  BigBadCard({
    this.text = "I am a big bad card!",
    this.icon = "star",
  });

  @override
  _BigBadCardState createState() => _BigBadCardState();
}

class _BigBadCardState extends State<BigBadCard>
    with SingleTickerProviderStateMixin {
  AnimationController _cardRotation;
  bool _showFront = false;
  bool _cardNotChanged = true;
  bool _cardNotStopped = true;

  @override
  void initState() {
    _cardRotation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2400),
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
    if (_cardNotChanged && _cardNotStopped) rotate();

    final Widget _cardFront = Container(
      height: _height,
      width: _width,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/widget/card.svg",
            height: _height,
            width: _width,
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/${widget.icon}.svg",
              color: Colors.white,
              height: 160.0,
              width: 160.0,
            ),
          ),
        ],
      ),
    );
    final Widget _cardBack = Container(
      height: _height,
      width: _width,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/widget/card.svg",
            height: _height,
            width: _width,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: AppTextStyle.bigBadCardText,
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () async {
          if (_cardNotStopped) {
            setState(() {
              _cardNotStopped = !_cardNotStopped;
              _showFront = false;
              _cardRotation.reset();
            });
          } else {
            setState(() {
              _cardNotStopped = !_cardNotStopped;
              _showFront = false;
              _cardNotChanged = true;
            });
          }
        },
        child: AnimatedBuilder(
          animation: _cardRotation,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationY((_cardRotation.value) * Math.pi / 2),
              alignment: Alignment.center,
              child: Container(
                height: _height,
                width: _width,
                child: _showFront ? _cardFront : _cardBack,
              ),
            );
          },
        ),
      ),
    );
  }
}
