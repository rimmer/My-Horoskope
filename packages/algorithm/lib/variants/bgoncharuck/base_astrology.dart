part of 'algorithm.dart';

/// Complex algorithm that implements _OldWisdom by six ezoterics practices,
/// mostly with rome (greek) astrology, kabbalah, tarot, astro(nomy/logy) XVII-XVIIIs, numerology and hermetism
/// Researched, calculated and created with love by @bgoncharuck
/// Rights reserved by @rimmer
class _Astrology implements _OldWisdom {
  Map<ProphecyType, ProphecyEntity> says(UserEntity aboutUser, int inTimeOf) {
    //
    /// prophecy value placeholders
    double internalStr = 0.0;
    double moodlet = 0.0;
    double ambition = 0.0;
    double intelligence = 0.0;
    double luck = 0.0;

    /// if values reach more then 100, they will be cutted down to 100 in the bloc
    /// and will be divided by 10 before going to representation layer
    /// 1-100 was more comfortable for calculation, so I use it

    /// needed data
    int birthDateInteger = aboutUser.model.birth;
    String astroSign = birthDateInteger.astroSign;
    DateTime calculationDate = DateTime.fromMillisecondsSinceEpoch(inTimeOf);
    DateTime birthDate = DateTime.fromMillisecondsSinceEpoch(birthDateInteger);
    //

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
    final internalStrAmbitionBase = _InternalStrAmbitionBase
        .mapSignAndMonthToValue[astroSign][calculationDate.month];

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
    final moodIntelLuckBase =
        _moodIntelLuckBase(birthDate.day, calculationDate.day);

    moodlet += moodIntelLuckBase;
    intelligence += moodIntelLuckBase;
    luck += moodIntelLuckBase;

    // - - -

    /// @CHAOTIC value of placeholders

    /// the most unstable value of the algorithm
    /// days of week was named after Rome Gods
    /// for example, Moon day, Saturn day, Sun day,
    /// Wednesday was called mercredi, or day of Mercury
    /// Great Britan as well as other german tribes were conqured by Rome Empire
    /// and some names of week take different names from traditional week names
    /// wednes came from "day of the Woden" for Anglo-Saxons
    /// for example, in italian and francian Wednesday is still mercredi/mercoledì
    ///
    /// I calculate mod between difference of current day
    /// and the day when user was born
    /// for example,
    /// if user were born in 23 of June in 1991
    /// and todays 30 September of 2020
    /// it will be: (10692 days lived) % 7
    /// but I decided a god for every prophecy as an addition to days lived
    /// and it will be:
    /// (10692 days lived + prophecy additon) % 7
    ///
    /// And then I multiple it on 3
    ///
    /// Both week name and astrologic sign are decided to some gods
    /// if these Gods have the same name, prophecy will get additional 4 points
    ///
    internalStr += dayOfWeekCalc(
        birthDate, calculationDate, ProphecyType.INTERNAL_STRENGTH);
    moodlet += dayOfWeekCalc(birthDate, calculationDate, ProphecyType.MOODLET);
    ambition +=
        dayOfWeekCalc(birthDate, calculationDate, ProphecyType.AMBITION);
    intelligence +=
        dayOfWeekCalc(birthDate, calculationDate, ProphecyType.INTELLIGENCE);
    luck += dayOfWeekCalc(birthDate, calculationDate, ProphecyType.LUCK);

    /// @MYSTIC
    /// this is the most interesting part of an alforithm
    ///
    /// Pre-story:
    /// I spoke with some people that created trending websites about horoskopes
    /// And mostly, they just figure out something "on their own"
    /// that had no any connection with astrology.
    /// That was very disappointing.
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
    /// In one day from 56s (probability )
    /// User will get the card that represents its astrologic sign
    ///
  }
}
