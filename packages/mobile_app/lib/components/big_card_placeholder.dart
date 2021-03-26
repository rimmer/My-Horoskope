import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_assets.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'package:text/text.dart';

const _height = 159.0;
const _width = 437.0;

class BigCardPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          image: StaticAsset.rust["card_placeholder"],
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          localeText.clarifyForecast,
          style: AppTextStyle.bigCardText,
        ),
      ),
    );
  }
}
