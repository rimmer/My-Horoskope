import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prophet/components/user_settings/index.dart';

class StaticAsset {
  static Map<String, SvgPicture> svg = {
    "title_info": SvgPicture.asset(
      "assets/widget/title_info.svg",
    ),
  };
  static Map<String, AssetImage> rust = {
    "background": AssetImage('assets/background.png'),
    "card_text": AssetImage("assets/card/card_text.png"),
    "card_placeholder": AssetImage("assets/card/card_placeholder.png"),
    "magic_checkbox_true": AssetImage('assets/widget/magic_checkbox_true.png'),
    "magic_checkbox_false":
        AssetImage('assets/widget/magic_checkbox_false.png'),
  };
}
