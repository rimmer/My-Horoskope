import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_assets.dart';
import 'package:my_prophet/theme/app_text_style.dart';

// const _height = 222.0;
// const _width = 437.0;

class BigCard extends StatefulWidget {
  final String text;

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
          child: Center(
            child: Text(
              widget.text,
              style: AppTextStyle.bigCardText,
            ),
          ),
        ),
      ),
    );
  }
}
