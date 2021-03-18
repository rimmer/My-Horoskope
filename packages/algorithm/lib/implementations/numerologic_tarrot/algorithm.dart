import 'package:my_prophet/prophecy/entity/prophecy.dart';
import 'package:my_prophet/int_datetime.dart';
import 'package:my_prophet/user/entity/user.dart';
import 'sheets.dart';
import 'fucntions.dart';

const _biggestBonus = 52;
const _bigBonus = 46;
const _middleBonus = 42;
const _bonusPointsMagnitude = 13;

/// Complex algorithm that implements _OldWisdom by six ezoterics practices,
/// mostly with rome (greek) astrology, kabbalah, tarot, astro(nomy/logy) XVII-XVIIIs, numerology and hermetism
/// Researched, calculated and created with love by @bgoncharuck
/// Rights reserved by @rimmer
Map<ProphecyType, ProphecyEntity> numerologicAndTarrotProphet(
    {UserEntity aboutUser, int inTimeOf}) {
  //

  /// prophecy value placeholders
  double internalStr = 0.0;
  double moodlet = 0.0;
  double ambition = 0.0;
  double intuition = 0.0;
  double luck = 0.0;

  /// if values reach more then 100, they will be cutted down to 100 in the bloc
  /// and will be divided by 10 before going to representation layer
  /// 1-100 was more comfortable for calculation, so I use it
  /// needed data
  int birthDateInteger = aboutUser.model.birth;
  String astroSign = birthDateInteger.astroSign;
  DateTime calculationDate = DateTime.fromMillisecondsSinceEpoch(inTimeOf);
  DateTime birthDate = DateTime.fromMillisecondsSinceEpoch(birthDateInteger);
  int daysLived = (calculationDate.difference(birthDate)).inDays;
  RomGod userPatron = birthDate.patron;
  TarotSuit userSuit = elementToTarotSuit(birthDateInteger.astroElement);
  //

  print(calculationDate.toIso8601String());

  /// @CHAOTIC value of placeholders
  /// The most unstable value of the algorithm
  /// Days of week were named after Roman Gods
  /// For example: Moon day, Saturn day, Sun day,
  /// Wednesday was called mercredi, or day of Mercury
  /// Great Britan as well as other german tribes were conqured by Rome Empire
  /// and some names of week take different names from traditional week names,
  /// For example: Wednes came from "day of the Woden" for Anglo-Saxons
  /// In italian and francian Wednesday is still mercredi/mercoledì
  ///
  /// I calculate mod between difference of current day
  /// and the day when user was born
  ///
  /// Example:
  /// if user were born in 23 of June in 1991
  /// and todays 30 September of 2020
  /// it will be: (10692 days lived) % 7
  /// but I decided a god for every prophecy as an addition to days lived
  /// and it will be:
  /// (10692 days lived + prophecy additon) % 7
  ///
  /// And then I multiple it on 5
  ///
  /// Both week name and astrologic sign are decided to some gods
  /// if these Gods have the same name, prophecy will get additional 4 points
  ///
  internalStr +=
      dayOfWeekCalc(birthDate, calculationDate, ProphecyType.INTERNAL_STRENGTH);
  moodlet += dayOfWeekCalc(birthDate, calculationDate, ProphecyType.MOODLET);
  ambition += dayOfWeekCalc(birthDate, calculationDate, ProphecyType.AMBITION);
  intuition +=
      dayOfWeekCalc(birthDate, calculationDate, ProphecyType.INTUITION);
  luck += dayOfWeekCalc(birthDate, calculationDate, ProphecyType.LUCK);

  //@DEBUG
  // print("- - -\nChaotic:");
  // print("Prophecy: Internal Strength, chaotic points: $internalStr");
  // print("Prophecy: Moodlet, chaotic points: $moodlet");
  // print("Prophecy: Ambition, chaotic points: $ambition");
  // print("Prophecy: Intuition, chaotic points: $intuition");
  // print("Prophecy: Luck, chaotic points: $luck");

  // - - -

  /// @BASE base of value placeholders
  //

  /// when the Earth revolves around the Sun
  /// it enters the realm of a certain zodiac sign,
  /// which affects people in different ways,
  /// depending on current month
  /// it is not absolutely accurate, but different astro signs
  /// have more or less apathy in some periods of the year
  ///
  /// when the zodiacal conflict takes place someone
  /// wants to do less and rest more, and, actually, must rest more
  ///
  /// when sun is in your sign, you will
  /// have opportunity to plan a new year with a new forces
  /// so apathy will be minimal
  ///
  /// I decided to use it as a basic value for ambition and internal strength
  /// and we have basic value from 3 to 36
  /// it is the most constant value in the algorithm which changes once per month
  final internalStrAmbitionBase = InternalStrAmbitionBase
      .mapSignAndMonthToValue[astroSign][calculationDate.month];

  //@DEBUG
  // print("- - -\nBase:");
  // print("Prophecy: Internal Strength, base points: $internalStrAmbitionBase");
  // print("Prophecy: Ambition, base points: $internalStrAmbitionBase");

  ambition += internalStrAmbitionBase;
  internalStr += internalStrAmbitionBase;

  //

  /// numerologic union is a method in hermetism and later in the numerology
  /// that presents in every religion or ezoterics practice
  /// example of it:
  ///
  /// in: 26, out: 8
  ///
  /// in: 14, out: 5
  ///
  /// 2+6 = 8
  ///
  /// 1+4= 5
  ///
  /// in: 29, out: 2
  ///
  /// 2+9=11, 11>9, 1+1= 2
  ///
  /// I used difference between numerologic union of birthday and
  /// numerologic union of current day of month as a base for
  /// intelligence, luck and mood
  /// the bigger is difference, the lesser points will be getted
  /// multiplier is 4
  ///
  /// points avaible are from 4 to 36
  /// this value is slowly changing every day
  final moodIntuitLuckBase =
      moodIntuitionLuckBase(birthDate.day, calculationDate.day);

  //@DEBUG
  // print("Prophecy: Moodlet, base points: $moodIntuitLuckBase");
  // print("Prophecy: Intuition, base points: $moodIntuitLuckBase");
  // print("Prophecy: Luck, base points: $moodIntuitLuckBase");

  moodlet += moodIntuitLuckBase;
  intuition += moodIntuitLuckBase;
  luck += moodIntuitLuckBase;

  //@DEBUG
  // print("- - -\nCalesial tarot calcualtion:");

  /// @MYSTIC
  /// this is the most interesting part of an algorithm
  ///
  /// Pre-story:
  /// I spoke with some people that created trending websites about horoskopes
  /// And mostly, they just figure out something "on their own"
  /// that had no any connection with astrology.
  /// It was very disappointing.
  ///
  /// But I heard from two peoples that they used "Calesial Tarot"
  /// Tarot is a cards deck, that came from jewish Kabbalah
  /// And later on was redone in many formats, from an popular
  /// card game "Joker"/"Fool" till the use in many ezoterics practices
  /// "Calesial" tarot was done for astrologic purpose.
  /// Exactly what we needed. And you will understand why.
  /// I actually buyed one deck of "Calesial Tarot", nice art work.
  ///
  /// About this part of algorithm:
  /// I used days modulus from previous "Chaotic" idea
  /// But with modulus 56, 78 and 22.
  ///
  /// Calesial tarot has 78 cards
  /// First 22 cards called major arcana
  /// Every card represents astrologic sign
  /// Or planet is Solar system
  ///
  /// Next 56 cards divided in groups by 14 cards
  /// Wands (Fire), Pentactles (Earth), Swords(Air) and Cups(Water)
  /// Arts on them represents stories from Roman/Greek mythology
  /// But last 3 arts in every group also represent astrologic signs.
  /// More of it, every group has an element that represents group of
  /// astrologic signs. And even last 3 cards has names of its element.
  /// For example, "King of Wands" is called "Cardinal Fire"
  /// which is "Aries" in astrology
  ///
  ///
  /// How can we use it in our algorithm?
  /// We have 78 cards, half of these cards are connected
  /// to the astrologic signs
  /// And all 78 cards connected to the elements of the astrologic signs.
  ///
  /// We will do modulus %56, %78, %22
  /// On days that person lived
  ///
  /// In modulus %56
  int mod56 = daysLived % 56;
  //@DEBUG
  // print("CTarot: Minor is $mod56,");

  /// In one day from 56
  /// User can get the card that represents its astrologic sign
  bool probabilityMinor = userPatron == Kabbalah.patronMinor[mod56];
  //@DEBUG
  // print(
  //     "CTarot: Minor Card is ${(probabilityMinor) ? "" : "NOT "}user patron,");

  ///
  /// Probability is 1/56, but 4 signs have probability 2/56
  /// If with such low probability user gets a card with its sign
  /// All prophecies get +52 points
  /// With ideal situation user will have 122 total points in every prophecy
  /// and will be cutted down to 100.
  /// But this ideal situation can happen once per 10 years or so.
  /// In modulus %78
  int mod78 = daysLived % 78;
  //@DEBUG
  // print("CTarot: Full is $mod78,");

  /// In 3 days from 78
  /// User can get the card that represents its astrologic sign
  bool probabilityFull = userPatron == Kabbalah.patronFull[mod78];
  //@DEBUG
  // print(
  //     "CTarot: Minor+Major Card is ${(probabilityFull) ? "" : "NOT "}user patron,");

  ///
  /// Probability is 3/78 or 1/26
  /// If with such probability user gets a card with its sign
  /// All prophecies get +46 points
  /// With ideal situation user will have 116 total points
  /// and will be cutted to 100
  /// But this ideal situation can happen once per 7 years or so
  /// In modulus %22
  int mod22 = daysLived % 22;
  //@DEBUG
  // print("CTarot: Major is $mod22,");

  /// In 2 days from 22
  /// User can get card that represents its astrologic sign
  bool probabilityMajor = userPatron == Kabbalah.patronMajor[mod22];
  //@DEBUG
  // print(
  //     "CTarot: Major Card is ${(probabilityMajor) ? "" : "NOT "}user patron,");

  ///
  /// Probability is 2/22 or 1/11
  /// All prophecies wil get +42 points
  /// With ideal situation user will have 112 total points
  /// and will be cutted to 100
  /// But it can happen once per 3 years or so
  if (probabilityMinor) {
    //
    internalStr += _biggestBonus;
    moodlet += _biggestBonus;
    ambition += _biggestBonus;
    intuition += _biggestBonus;
    luck += _biggestBonus;
    //@DEBUG
    // print(
    //     "CTarot: user won the biggest bonus, which is $_biggestBonus points for every prophecy,");
    //
  } else if (probabilityFull) {
    //
    internalStr += _bigBonus;
    moodlet += _bigBonus;
    ambition += _bigBonus;
    intuition += _bigBonus;
    luck += _bigBonus;
    //@DEBUG
    // print(
    //     "CTarot: user won a big bonus, which is $_bigBonus points for every prophecy,");
    //
  } else if (probabilityMajor) {
    //
    internalStr += _middleBonus;
    moodlet += _middleBonus;
    ambition += _middleBonus;
    intuition += _middleBonus;
    luck += _middleBonus;
    //@DEBUG
    // print(
    //     "CTarot: user won a middle bonus, which is $_middleBonus points for every prophecy,");
    //
  } else {
    /// in most days user will not get so huge bonuses
    /// but we must add some big numbers, because minimal base value is
    /// 3 or 4 + 5 + whatever we do here
    ///
    /// And minimal value from this part, for every prophecy will be +14
    /// It will give total 4+3+14= 21 minimal value to any prophecy
    /// in the worst situation, and will be added up to 27 in the BLoC,
    /// 27 will be the minimal value possible by a BLoC check.
    ///
    /// Now, let us return to this part of algorithm
    /// Even if user did not get a card with his sign
    /// He still get some other card
    /// In minor probability mod we have 14*4 cards for every element
    /// From Kabbalah sense, the elements change in such order:
    /// Wands (Fire) -> Pentacles (Earth) -> Swords (Air) -> Cups (Water)
    ///
    /// Very interesting, it is similar to the cast system in India
    /// And buddism. And also it represents Europe in the dark age.
    /// Wands - artisans, Pentacles - merchants,
    /// Swords - military, Cups - clergy (priests)
    /// That is why "King of wands look up to pentacles",
    /// It means transformation from one element to another
    ///
    /// So, I made a table divided by 14 days for every element,
    /// Which is called suit
    /// Every day has new values for every suit
    /// From 14 to 38 depending on user's astrosign element
    /// This value changes dynamically every day by only 1 point
    /// see _Kabbalah.impactMinor for more details
    int impactValue = Kabbalah.impactMinor[mod56][userSuit];
    //@DEBUG
    // print("CTarot: user won $impactValue points for every prophecy,");

    internalStr += impactValue;
    moodlet += impactValue;
    ambition += impactValue;
    intuition += impactValue;
    luck += impactValue;

    /// And then we have bonus points to one prophecy
    /// By mod22
    ProphecyType bonusPoints = Kabbalah.impactMajor[mod22];

    switch (bonusPoints) {
      case ProphecyType.INTERNAL_STRENGTH:
        internalStr += _bonusPointsMagnitude;
        //@DEBUG
        // print(
        //     "CTarot: user won $_bonusPointsMagnitude points to internal strength,");
        break;
      case ProphecyType.MOODLET:
        moodlet += _bonusPointsMagnitude;
        //@DEBUG
        // print("CTarot: user won $_bonusPointsMagnitude points to moodlet,");
        break;
      case ProphecyType.AMBITION:
        ambition += _bonusPointsMagnitude;
        //@DEBUG
        // print("CTarot: user won $_bonusPointsMagnitude points to ambition,");
        break;
      case ProphecyType.INTUITION:
        intuition += _bonusPointsMagnitude;
        //@DEBUG
        // print(
        //     "CTarot: user won $_bonusPointsMagnitude points to intelligence,");
        break;
      case ProphecyType.LUCK:
        luck += _bonusPointsMagnitude;
        //@DEBUG
        // print("CTarot: user won $_bonusPointsMagnitude points to luck,");
        break;
    }
  }

  /// @END
  /// Result,
  ///
  /// First we print,
  print("- - -\nResult:");
  print("Prophecy: Internal Strength, total points: $internalStr");
  print("Prophecy: Moodlet, total points: $moodlet");
  print("Prophecy: Ambition, total points: $ambition");
  print("Prophecy: Intelligence, total points: $intuition");
  print("Prophecy: Luck, total points: $luck");

  /// Now, we finally send out values to our algorithm module call:
  return {
    ProphecyType.INTERNAL_STRENGTH:
        ProphecyEntity(id: ProphecyType.INTERNAL_STRENGTH, value: internalStr),
    //

    ProphecyType.MOODLET:
        ProphecyEntity(id: ProphecyType.MOODLET, value: moodlet),
    //

    ProphecyType.AMBITION:
        ProphecyEntity(id: ProphecyType.AMBITION, value: ambition),
    //

    ProphecyType.INTUITION:
        ProphecyEntity(id: ProphecyType.INTUITION, value: intuition),
    //

    ProphecyType.LUCK: ProphecyEntity(id: ProphecyType.LUCK, value: luck),
  };
}
