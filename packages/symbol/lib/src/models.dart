import 'package:meta/meta.dart';

enum TarrotMajor {
  TheMagician,
  TheHighPriestess,
  TheEmpress,
  TheEmperor,
  TheHierophant,
  TheLovers,
  TheChariot,
  Strength,
  TheHermit,
  TheWheelOfFortune,
  Justice,
  TheHangedMan,
  Rebirth,
  Temperance,
  Lust,
  TheTower,
  TheStar,
  TheMoon,
  TheSun,
  Judgment,
  TheFool,
  TheWorld,
}

const TarrotMajorToFileName = {
  TarrotMajor.TheMagician: "tarrot_major_magician.png",
  TarrotMajor.TheHighPriestess: "tarrot_major_high_priestess.png",
  TarrotMajor.TheEmpress: "tarrot_major_empress.png",
  TarrotMajor.TheEmperor: "tarrot_major_emperor.png",
  TarrotMajor.TheHierophant: "tarrot_major_hierophant.png",
  TarrotMajor.TheLovers: "tarrot_major_lovers.png",
  TarrotMajor.TheChariot: "tarrot_major_chariot.png",
  TarrotMajor.Strength: "tarrot_major_strength.png",
  TarrotMajor.TheHermit: "tarrot_major_hermit.png",
  TarrotMajor.TheWheelOfFortune: "tarrot_major_fortune.png",
  TarrotMajor.Justice: "tarrot_major_justice.png",
  TarrotMajor.TheHangedMan: "tarrot_major_hanged_man.png",
  TarrotMajor.Rebirth: "tarrot_major_rebirth.png",
  TarrotMajor.Temperance: "tarrot_major_temperance.png",
  TarrotMajor.Lust: "tarrot_major_lust.png",
  TarrotMajor.TheTower: "tarrot_major_tower.png",
  TarrotMajor.TheStar: "tarrot_major_star.png",
  TarrotMajor.TheMoon: "tarrot_major_moon.png",
  TarrotMajor.TheSun: "tarrot_major_sun.png",
  TarrotMajor.Judgment: "tarrot_major_judgment.png",
  TarrotMajor.TheFool: "tarrot_major_fool.png",
  TarrotMajor.TheWorld: "tarrot_major_world.png",
};

enum Gem {
  Pearl,
  Diamond,
  Ruby,
  Garnet,
  RedTourmaline,
  RedSpinel,
  Carbuncle,
  FireOpal,
  Amber,
  OrangeSapphire,
  OrangeTopaz,
  Citrine,
  YellowSapphire,
  Peridot,
  Emerald,
  Chrysolite,
  Zircon,
  Alexandrite,
  Aquamarine,
  Beryl,
  Opal,
  Topaz,
  Kyanite,
  BlueTourmaline,
  BlueSapphire,
  Rhodolite,
  Amethyst,
  PurpleSpinel,
  BlackTopaz,
  Onyx,
  BlackPearl,
}

const GemToFileName = {
  Gem.Pearl: "gem_pearl.svg",
  Gem.Diamond: "gem_diamond.svg",
  Gem.Ruby: "gem_ruby.svg",
  Gem.Garnet: "gem_garnet.svg",
  Gem.RedTourmaline: "gem_red_tourmaline.svg",
  Gem.RedSpinel: "gem_red_spinel.svg",
  Gem.Carbuncle: "gem_carbuncle.svg",
  Gem.FireOpal: "gem_fire_opal.svg",
  Gem.Amber: "gem_amber.svg",
  Gem.OrangeSapphire: "gem_orange_sapphire.svg",
  Gem.OrangeTopaz: "gem_orange_topaz.svg",
  Gem.Citrine: "gem_citrine.svg",
  Gem.YellowSapphire: "gem_yellow_sapphire.svg",
  Gem.Peridot: "gem_peridot.svg",
  Gem.Emerald: "gem_emerald.svg",
  Gem.Chrysolite: "gem_chrysolite.svg",
  Gem.Zircon: "gem_zircon.svg",
  Gem.Alexandrite: "gem_alexandrite.svg",
  Gem.Aquamarine: "gem_aquamarine.svg",
  Gem.Beryl: "gem_beryl.svg",
  Gem.Opal: "gem_opal.svg",
  Gem.Topaz: "gem_topaz.svg",
  Gem.Kyanite: "gem_kyanite.svg",
  Gem.BlueTourmaline: "gem_blue_tourmaline.svg",
  Gem.BlueSapphire: "gem_blue_sapphire.svg",
  Gem.Rhodolite: "gem_rhodolite.svg",
  Gem.Amethyst: "gem_amethyst.svg",
  Gem.PurpleSpinel: "gem_purple_spinel.svg",
  Gem.BlackTopaz: "gem_black_topaz.svg",
  Gem.BlackPearl: "gem_black_pearl.svg",
  Gem.Onyx: "gem_onyx.svg",
};

const DigitToFileName = {
  1: "numerologic_one.svg",
  2: "numerologic_two.svg",
  3: "numerologic_three.svg",
  4: "numerologic_four.svg",
  5: "numerologic_five.svg",
  6: "numerologic_six.svg",
  7: "numerologic_seven.svg",
  8: "numerologic_eight.svg",
  9: "numerologic_nine.svg",
};

enum Color {
  RedLight,
  Red,
  RedDeep,
  PinkLight,
  Pink,
  PinkDeep,
  PurpleLight,
  Purple,
  PurpleDeep,
  BlueLight,
  Blue,
  BlueDeep,
  Teal,
  Cyan,
  Lime,
  GreenLight,
  Green,
  GreenDeep,
  YellowLight,
  Yellow,
  Brown,
  OrangeLight,
  Orange,
  OrangeDeep,
  Black,
  White,
  Grey,
  BlueGrey,
}

const ColorToInt = {
  Color.RedLight: 0xFFFF4646,
  Color.Red: 0xFFFF0000,
  Color.RedDeep: 0xFFBE0000,
  Color.PinkLight: 0xFFFFB2B2,
  Color.Pink: 0xFFFF7D7D,
  Color.PinkDeep: 0xFFC65959,
  Color.PurpleLight: 0xFFDBC5F7,
  Color.Purple: 0xFFA258FF,
  Color.PurpleDeep: 0xFF6900ED,
  Color.BlueLight: 0xFFA4CEFF,
  Color.Blue: 0xFF03A4FF,
  Color.BlueDeep: 0xFF007EC5,
  Color.Teal: 0xFF4EBBAB,
  Color.Cyan: 0xFF00D2DF,
  Color.Lime: 0xFFBECC69,
  Color.GreenLight: 0xFF9CE73D,
  Color.Green: 0xFF04C300,
  Color.GreenDeep: 0xFF008C1F,
  Color.YellowLight: 0xFFFFF975,
  Color.Yellow: 0xFFFFE600,
  Color.Brown: 0xFFAD8460,
  Color.OrangeLight: 0xFFFFBC62,
  Color.Orange: 0xFFFA8C3B,
  Color.OrangeDeep: 0xFFE05100,
  Color.Black: 0xFF000000,
  Color.White: 0xFFFFFFFF,
  Color.Grey: 0xFFC4C4C4,
  Color.BlueGrey: 0xFF97C0C2,
};

enum Range {
  low,
  ordinary,
  high,
}

Range rangeFromValue(double value) {
  if (value <= 52.0)
    return Range.low;
  else if (value <= 78.0) return Range.ordinary;
  return Range.high;
}

@immutable
class PropheciesRange {
  final Range mood;
  final Range intuition;
  final Range luck;
  final Range ambition;
  final Range internalStrength;

  const PropheciesRange({
    @required this.mood,
    @required this.intuition,
    @required this.luck,
    @required this.ambition,
    @required this.internalStrength,
  });
}
