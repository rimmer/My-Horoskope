import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _smallCardHeight = 100.0;
const _smallCardWidth = 64.0;

class StaticAsset {
  static Map<String, SvgPicture> svg = {
    "dark_coins": SvgPicture.asset(
      "assets/card/dark_coins.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "dark_cup": SvgPicture.asset(
      "assets/card/dark_cup.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "dark_star": SvgPicture.asset(
      "assets/card/dark_star.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "dark_sword": SvgPicture.asset(
      "assets/card/dark_sword.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
    ),
    "dark_tree": SvgPicture.asset(
      "assets/card/dark_tree.svg",
      height: _smallCardHeight,
      width: _smallCardWidth,
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
    "magic_checkbox_true": AssetImage('assets/widget/magic_checkbox_true.png'),
    "magic_checkbox_false":
        AssetImage('assets/widget/magic_checkbox_false.png'),
  };
}
