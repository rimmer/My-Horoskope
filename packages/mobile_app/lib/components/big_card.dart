import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prophet/theme/app_text_style.dart';

const _height = 222.0;
const _width = 437.0;

class BigCard extends StatefulWidget {
  final String text;
  final background = SvgPicture.asset(
    "assets/card/card_text.svg",
    height: _height,
    width: _width,
  );

  BigCard({this.text = "I am the card!"});

  @override
  _BigCardState createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> with TickerProviderStateMixin {
  AnimationController _cardMoveController;
  Animation<Offset> _cardMove;

  @override
  void initState() {
    _cardMoveController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _cardMove = Tween<Offset>(
      begin: Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _cardMoveController,
      curve: Curves.easeInOut,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _cardMoveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _cardMoveController,
      builder: (context, child) => SlideTransition(
        position: _cardMove,
        child: Container(
          height: _height,
          width: _width,
          child: Stack(
            children: [
              widget.background,
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      widget.text,
                      style: AppTextStyle.bigCardText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
