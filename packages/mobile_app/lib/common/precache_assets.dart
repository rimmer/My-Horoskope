import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';

class PrecacheAssets {
  static Map<String, ScalableImage> svg = {};

  static List<String> _cardsAssets = [
    "dark_colors",
    "dark_gems",
    "dark_numbers",
    "dark_tarrot",
    "dark_text",
    "light_colors",
    "light_gems",
    "light_numbers",
    "light_tarrot",
    "light_text",
  ];
  
  static Future<void> startSvgLoad() async {
    List<Future<ScalableImage>> imageFutures = [];

    // add cards
    _cardsAssets.forEach((card) {
      imageFutures.add(
          ScalableImage.fromSIAsset(rootBundle, "assets/card/$card.si"));
    });

    // add numerology assets
    for (var i = 1; i < 10; i++) {
      imageFutures.add(
          ScalableImage.fromSIAsset(rootBundle, "assets/numerology/$i.si"));
    };
    
    return Future.wait(imageFutures).then((images) => {
      for (var i = 0; i < _cardsAssets.length; i++) {
        svg[_cardsAssets[i]] = images[i]
      },
      for (var i = 1; i < 10; i++) {
        svg["$i.svg"] = images[_cardsAssets.length + i - 1]
      }
    });
//
  }

  static rustLoad(BuildContext context) {
    precacheImage(AssetImage("assets/background.png"), context);
    precacheImage(AssetImage("assets/card/card_text.png"), context);
    precacheImage(AssetImage("assets/card/card_placeholder.png"), context);
    precacheImage(AssetImage("assets/widget/magic_checkbox_true.png"), context);
    precacheImage(
        AssetImage("assets/widget/magic_checkbox_false.png"), context);
    precacheImage(AssetImage("assets/tarrot/chariot.png"), context);
    precacheImage(AssetImage("assets/tarrot/emperor.png"), context);
    precacheImage(AssetImage("assets/tarrot/empress.png"), context);
    precacheImage(AssetImage("assets/tarrot/fool.png"), context);
    precacheImage(AssetImage("assets/tarrot/fortune.png"), context);
    precacheImage(AssetImage("assets/tarrot/hanged.png"), context);
    precacheImage(AssetImage("assets/tarrot/hermit.png"), context);
    precacheImage(AssetImage("assets/tarrot/hierophant.png"), context);
    precacheImage(AssetImage("assets/tarrot/high_priestess.png"), context);
    precacheImage(AssetImage("assets/tarrot/judgment.png"), context);
    precacheImage(AssetImage("assets/tarrot/justice.png"), context);
    precacheImage(AssetImage("assets/tarrot/lovers.png"), context);
    precacheImage(AssetImage("assets/tarrot/lust.png"), context);
    precacheImage(AssetImage("assets/tarrot/magician.png"), context);
    precacheImage(AssetImage("assets/tarrot/moon.png"), context);
    precacheImage(AssetImage("assets/tarrot/rebirth.png"), context);
    precacheImage(AssetImage("assets/tarrot/star.png"), context);
    precacheImage(AssetImage("assets/tarrot/strength.png"), context);
    precacheImage(AssetImage("assets/tarrot/sun.png"), context);
    precacheImage(AssetImage("assets/tarrot/temperance.png"), context);
    precacheImage(AssetImage("assets/tarrot/tower.png"), context);
    precacheImage(AssetImage("assets/tarrot/world.png"), context);
  }
}
