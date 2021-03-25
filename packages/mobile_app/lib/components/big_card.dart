import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prophet/theme/app_text_style.dart';

const _height = 222.6;
const _width = 437.3;

class BigCard extends StatelessWidget {
  final String text;
  BigCard({this.text = "I am the card!"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/card/card_text.svg",
            height: _height,
            width: _width,
          ),
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
                  text,
                  style: AppTextStyle.bigCardText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
