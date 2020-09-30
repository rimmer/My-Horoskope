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
    /// and todays 20 May of 2020
    /// it will be: (10692 days lived) % 7
    /// but I decided a god for every prophecy as an addition to days lived
    /// and it will be:
    /// (10692 days lived + prophecy additon) % 7
    ///
    /// And then I multiple it on 3
    ///
    /// Both week name and astrologic sign are decided to some god
    /// if this Gods has the same name, prophecy get additional 4 points
  }
}
