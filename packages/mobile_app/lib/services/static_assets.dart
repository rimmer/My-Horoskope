import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prophet/components/user_settings/index.dart';

const _smallCardHeightFull = 100.0;
const _smallCardWidthFull = 64.0;
const _smallCardHeight = 95.0;
const _smallCardWidth = 60.8;

class StaticAsset {
  static Map<String, SvgPicture> svg = {
    "dark_coins": SvgPicture.asset(
      "assets/card/dark_coins.svg",
      height: _smallCardHeightFull,
      width: _smallCardWidthFull,
    ),
    "dark_cup": SvgPicture.asset(
      "assets/card/dark_cup.svg",
      height: _smallCardHeightFull,
      width: _smallCardWidthFull,
    ),
    "dark_star": SvgPicture.asset(
      "assets/card/dark_star.svg",
      height: _smallCardHeightFull,
      width: _smallCardWidthFull,
    ),
    "dark_sword": SvgPicture.asset(
      "assets/card/dark_sword.svg",
      height: _smallCardHeightFull,
      width: _smallCardWidthFull,
    ),
    "dark_tree": SvgPicture.asset(
      "assets/card/dark_tree.svg",
      height: _smallCardHeightFull,
      width: _smallCardWidthFull,
    ),
    "light_coins": SvgPicture.asset(
      "assets/card/light_coins.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "light_cup": SvgPicture.asset(
      "assets/card/light_cup.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "light_star": SvgPicture.asset(
      "assets/card/light_star.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "light_sword": SvgPicture.asset(
      "assets/card/light_sword.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "light_tree": SvgPicture.asset(
      "assets/card/light_tree.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "title_info": SvgPicture.asset(
      "assets/widget/title_info.svg",
    ),
  };
  static Map<String, AssetImage> rust = {
    "background": AssetImage('assets/background.jpg'),
    "card_text": AssetImage("assets/card/card_text.png"),
    "card_placeholder": AssetImage("assets/card/card_placeholder.png"),
    "magic_checkbox_true": AssetImage('assets/widget/magic_checkbox_true.png'),
    "magic_checkbox_false":
        AssetImage('assets/widget/magic_checkbox_false.png'),
  };
}
