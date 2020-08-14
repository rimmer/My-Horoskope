import 'package:int_datetime/int_datetime.dart';
import 'package:prophecy_model/prophecy_model.dart';

extension BasicAstrology on int {
  /// 21.01 .. 20.02 Aquarius
  /// 21.02 .. 20.03 Pisces
  /// 21.03 .. 20.04 Aries
  /// 21.04 .. 20.05 Taurus
  /// 21.05 .. 21.06 Gemini
  /// 22.06 .. 22.07 Cancer
  /// 23.07 .. 23.08 Leo
  /// 24.08 .. 23.09 Virgo
  /// 24.09 .. 23.10 Libra
  /// 24.10 .. 22.11 Scorpio
  /// 23.11 .. 21.12 Sagittarius
  /// 22.12 .. 20.01 Capricorn
  String get astroSign {
    switch (this.toDateTime.month) {
      case 1:
        if (this.toDateTime.day > 20) return "Aquarius";
        return "Capricorn";
      case 2:
        if (this.toDateTime.day > 20) return "Pisces";
        return "Aquarius";
      case 3:
        if (this.toDateTime.day > 20) return "Aries";
        return "Pisces";
      case 4:
        if (this.toDateTime.day > 20) return "Taurus";
        return "Aries";
      case 5:
        if (this.toDateTime.day > 20) return "Gemini";
        return "Taurus";
      case 6:
        if (this.toDateTime.day > 21) return "Cancer";
        return "Gemini";
      case 7:
        if (this.toDateTime.day > 22) return "Leo";
        return "Cancer";
      case 8:
        if (this.toDateTime.day > 23) return "Virgo";
        return "Leo";
      case 9:
        if (this.toDateTime.day > 23) return "Libra";
        return "Virgo";
      case 10:
        if (this.toDateTime.day > 23) return "Scorpio";
        return "Libra";
      case 11:
        if (this.toDateTime.day > 22) return "Sagittarius";
        return "Scorpio";
      case 12:
        if (this.toDateTime.day > 21) return "Capricorn";
        return "Sagittarius";
    }

    /// "must return something" warning solution
    return "Aries";
  }

  String get astroHousePlanet {
    switch (this.astroSign) {
      case "Aries":
        return "Mars";
      case "Taurus":
        return "Venus";
      case "Gemini":
        return "Mercury";
      case "Cancer":
        return "Moon";
      case "Leo":
        return "Sun";
      case "Virgo":
        return "Mercury";
      case "Libra":
        return "Venus";
      case "Scorpio":
        return "Pluto";
      case "Sagittarius":
        return "Jupiter";
      case "Capricorn":
        return "Saturn";
      case "Aquarius":
        return "Uranus";
      case "Pisces":
        return "Neptune";
    }

    /// "must return something" warning solution
    return "Mars";
  }
}

extension Karmic on String {
  /// Internal Str - Venus
  /// Moodlet - Mars
  /// Ambition - Sun
  /// Intelligence - Jupiter
  /// Luck - Mercury
  ///
  /// 7/13 middle
  /// x/13
  Map<ProphecyId, List<int>> get ChoiseConsequenceBySign {
    switch (this) {

      /// I will change astro signs to RPG classes, why not
      /// Internal Strength - new Health points gained at level
      /// Intelligence - new Skill points gained at level
      /// Moodlet - new Stamina and Mana points gained at level
      /// Ambition - Attack Damage/ability magnitude
      /// Luck - Defence Value magnitude
      //
      //
      case "Aries":

        /// aka Berserk
        /// class which is stronger the more health he loose
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [9, 9, 8, 7, 7, 7],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [7, 7, 7, 7, 7, 7],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [5, 7, 7, 8, 9, 10],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [7, 8, 9, 10, 11, 12],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [13, 12, 7, 5, 3, 1],
        };
      case "Taurus":

        /// aka Druid or Doctor
        /// support class which is not good for single play
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [3, 5, 7, 5, 9, 10],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [9, 9, 10, 11, 12, 13],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [11, 9, 7, 8, 9, 10],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [7, 7, 7, 7, 7, 7],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [5, 5, 7, 7, 8, 9],
        };
      case "Gemini":

        /// aka Nightblade or Shadow
        /// class which completely depended on its abilities,
        /// uses critical attacks and stealth
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [2, 3, 6, 6, 6, 6],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [13, 12, 11, 10, 9, 8],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [3, 4, 5, 6, 7, 8],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [2, 5, 7, 12, 13, 13],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [13, 1, 2, 3, 4, 13],
        };
      case "Cancer":

        /// aka Necromancer or Blood mage
        /// class with huge amount of mana and unique abilities,
        /// but very hard to play
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [3, 5, 7, 12, 9, 8],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [5, 7, 7, 12, 7, 7],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [13, 13, 13, 13, 13, 13],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [5, 5, 5, 5, 5, 9],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [6, 6, 6, 6, 6, 6],
        };
      case "Leo":

        /// aka Knight or Paladin
        /// class with middle health stats, big damage, but ordianry abilities
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [8, 7, 5, 4, 12, 6],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [4, 7, 5, 5, 9, 7],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [2, 2, 3, 4, 4, 7],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [13, 13, 13, 13, 13, 13],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [9, 13, 9, 9, 13, 9],
        };
      case "Virgo":

        /// aka Alchemist or Poisoner
        /// best class for late game play, which has best abilities on high levels
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [4, 4, 7, 7, 7, 7],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [3, 4, 7, 9, 11, 13],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [3, 4, 4, 7, 7, 8],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [8, 8, 7, 9, 9, 12],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [4, 4, 6, 7, 7, 7],
        };
      case "Libra":

        /// aka Tank
        /// class with best health and defence points but near no damage
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [13, 9, 9, 11, 13, 13],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [2, 3, 4, 5, 6, 7],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [7, 2, 7, 7, 6, 7],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [2, 3, 4, 5, 5, 5],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [13, 13, 13, 13, 13, 13],
        };
      case "Scorpio":

        /// aka Warlock or Elemental Mage
        /// class with biggest damage and lovest health
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [2, 2, 3, 4, 4, 7],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [5, 7, 5, 8, 7, 8],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [7, 6, 9, 13, 7, 13],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [13, 13, 13, 13, 13, 13],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [3, 7, 3, 7, 12, 7],
        };
      case "Sagittarius":

        /// aka Archer
        /// middle class, best for single play, but can deal huge amount of damage if used correctly
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [6, 9, 6, 9, 6, 9],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [4, 10, 4, 10, 4, 10],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [2, 3, 5, 6, 5, 7],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [12, 11, 7, 7, 13, 7],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [9, 7, 9, 7, 9, 7],
        };
      case "Capricorn":

        /// aka Martial Artist or Monk
        /// class with strong base stats but without good abilities
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [13, 7, 13, 7, 13, 7],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [3, 7, 3, 7, 3, 7],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [7, 13, 7, 13, 7, 13],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [6, 5, 4, 5, 6, 7],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [8, 6, 9, 8, 6, 9],
        };

      /// aka Adventurer or Artifact Hunter
      /// jask of all trades and master of none
      case "Aquarius":
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [7, 8, 7, 8, 7, 8],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [9, 4, 7, 4, 7, 9],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [7, 7, 9, 9, 9, 13],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [9, 3, 7, 3, 9, 7],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [13, 6, 7, 6, 13, 9],
        };
      case "Pisces":

        /// aka Werewolf or Shapeshifter
        /// a class which stats strongest on low levels but weak on high level
        return {
          /// Health points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTERNAL_STRENGTH: [9, 8, 7, 6, 5, 4],

          /// Skill points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.INTELLIGENCE: [10, 9, 8, 7, 6, 5],

          /// Stamina/Mana points gain at level: 1, 8, 17, 30, 45, 81
          ProphecyId.MOODLET: [7, 7, 7, 7, 7, 7],

          /// Damage/ability magnitude by used mana/stamina: 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%, strongest power use
          ProphecyId.AMBITION: [13, 12, 11, 10, 9, 8],

          /// Have much damage can be taken at health value: near dead, 1-15%, 15-30%, 30-45%, 45-60%, 50-75%, 75-90%
          ProphecyId.LUCK: [5, 7, 5, 7, 5, 7],
        };
    }
    return null;
  }
}
