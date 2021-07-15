import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

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
  TarrotMajor.TheMagician: "magician.png",
  TarrotMajor.TheHighPriestess: "high_priestess.png",
  TarrotMajor.TheEmpress: "empress.png",
  TarrotMajor.TheEmperor: "emperor.png",
  TarrotMajor.TheHierophant: "hierophant.png",
  TarrotMajor.TheLovers: "lovers.png",
  TarrotMajor.TheChariot: "chariot.png",
  TarrotMajor.Strength: "strength.png",
  TarrotMajor.TheHermit: "hermit.png",
  TarrotMajor.TheWheelOfFortune: "fortune.png",
  TarrotMajor.Justice: "justice.png",
  TarrotMajor.TheHangedMan: "hanged.png",
  TarrotMajor.Rebirth: "rebirth.png",
  TarrotMajor.Temperance: "temperance.png",
  TarrotMajor.Lust: "lust.png",
  TarrotMajor.TheTower: "tower.png",
  TarrotMajor.TheStar: "star.png",
  TarrotMajor.TheMoon: "moon.png",
  TarrotMajor.TheSun: "sun.png",
  TarrotMajor.Judgment: "judgment.png",
  TarrotMajor.TheFool: "fool.png",
  TarrotMajor.TheWorld: "world.png",
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
  Gem.Diamond: "diamond.svg",
  Gem.Ruby: "ruby.svg",
  Gem.Garnet: "garnet.svg",
  Gem.RedTourmaline: "red_tourmaline.svg",
  Gem.RedSpinel: "red_spinel.svg",
  Gem.Carbuncle: "carbuncle.svg",
  Gem.FireOpal: "fire_opal.svg",
  Gem.Amber: "amber.svg",
  Gem.OrangeSapphire: "orange_sapphire.svg",
  Gem.OrangeTopaz: "orange_topaz.svg",
  Gem.Citrine: "citrine.svg",
  Gem.YellowSapphire: "yellow_sapphire.svg",
  Gem.Peridot: "peridot.svg",
  Gem.Emerald: "emerald.svg",
  Gem.Chrysolite: "chrysolite.svg",
  Gem.Zircon: "zircon.svg",
  Gem.Alexandrite: "alexandrite.svg",
  Gem.Aquamarine: "aquamarine.svg",
  Gem.Beryl: "beryl.svg",
  Gem.Opal: "opal.svg",
  Gem.Topaz: "topaz.svg",
  Gem.Kyanite: "kyanite.svg",
  Gem.BlueTourmaline: "blue_tourmaline.svg",
  Gem.BlueSapphire: "blue_sapphire.svg",
  Gem.Rhodolite: "rhodolite.svg",
  Gem.Amethyst: "amethyst.svg",
  Gem.PurpleSpinel: "purple_spinel.svg",
  Gem.BlackTopaz: "black_topaz.svg",
  Gem.Onyx: "onyx.svg",

  // problem with file of black_pearl
  Gem.Pearl: "pearl.png",
  Gem.BlackPearl: "black_pearl.png",
};

const DigitToFileName = {
  1: "1.svg",
  2: "2.svg",
  3: "3.svg",
  4: "4.svg",
  5: "5.svg",
  6: "6.svg",
  7: "7.svg",
  8: "8.svg",
  9: "9.svg",
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
class PropheciesRange extends Equatable {
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

  @override
  List<Object> get props => [mood, intuition, luck, ambition, internalStrength];
}
