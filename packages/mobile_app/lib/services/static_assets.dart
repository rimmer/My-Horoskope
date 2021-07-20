import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';

class StaticAsset {
  static Map<String, ScalableImage> svg = {};

  static Future svgLoad() async {
//
    svg["dark_colors"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/dark_colors.svg");
//
    svg["dark_gems"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/dark_gems.svg");
//
    svg["dark_numbers"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/dark_numbers.svg");
//
    svg["dark_tarrot"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/dark_tarrot.svg");
//
    svg["dark_text"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/dark_text.svg");
//
    svg["light_colors"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/light_colors.svg");
//
    svg["light_gems"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/light_gems.svg");
//
    svg["light_numbers"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/light_numbers.svg");
//
    svg["light_tarrot"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/light_tarrot.svg");
//
    svg["light_text"] = await ScalableImage.fromSvgAsset(
        rootBundle, "assets/card/light_text.svg");
//
    svg["1.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/1.svg");
//
    svg["2.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/2.svg");
//
    svg["3.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/3.svg");
//
    svg["4.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/4.svg");
//
    svg["5.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/5.svg");
//
    svg["6.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/6.svg");
//
    svg["7.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/7.svg");
//
    svg["8.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/8.svg");
//
    svg["9.svg"] =
        await ScalableImage.fromSvgAsset(rootBundle, "assets/numerology/9.svg");
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
