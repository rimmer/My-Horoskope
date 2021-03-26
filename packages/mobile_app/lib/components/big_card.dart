import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_assets.dart';
import 'package:my_prophet/theme/app_text_style.dart';

const _height = 159.0;
const _width = 437.0;

class BigCard extends StatefulWidget {
  final String text;

  BigCard({this.text = "I am the card!"});

  @override
  _BigCardState createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> with SingleTickerProviderStateMixin {
  AnimationController _textFadeController;
  Animation<double> _textFade;

  @override
  void initState() {
    _textFadeController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _textFade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textFadeController,
      curve: Curves.ease,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _textFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textFadeController
      ..reset()
      ..forward();

    return Container(
      height: _height,
      width: _width,
      margin: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: StaticAsset.rust["card_text"],
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: AnimatedBuilder(
        animation: _textFadeController,
        builder: (context, child) => FadeTransition(
          opacity: _textFade,
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                widget.text,
                style: AppTextStyle.bigCardText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
