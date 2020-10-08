/// idea was created and discussed with Vladimir
///
/// first key is a current period of months (current astrologic sign)
///
/// second key is an astrologic sign
///
/// third key is what value need to be represented by a planet:
/// - false - negative
/// - true - positive
///
/// https://www.old.astrolus.ru/ingressplanets2020.html
/// it is only for 2020, but it is OK to use it up to ten years, +/-
const planetFor = {
  "Capricorn": {
    "Aries": {
      false: "Lilith",
      true: "Venus",
    },
    "Taurus": {
      false: "Saturn",
      true: "Moon",
    },
    "Gemini": {
      false: "Jupiter",
      true: "Venus",
    },
    "Cancer": {
      false: "Pluto",
      true: "Jupiter",
    },
    "Leo": {
      false: "Lilith",
      true: "Sun",
    },
    "Virgo": {
      false: "Mars",
      true: "Venus",
    },
    "Libra": {
      false: "Sun",
      true: "Moon",
    },
    "Scorpio": {
      false: "Saturn",
      true: "Sun",
    },
    "Sagittarius": {
      false: "Mars",
      true: "Sun",
    },
    "Capricorn": {
      false: "Moon",
      true: "Sun",
    },
    "Aquarius": {
      false: "Sun",
      true: "Mercury",
    },
    "Pisces": {
      false: "Mars",
      true: "Moon",
    },
  },
  "Aquarius": {
    "Aries": {
      false: "Neptune",
      true: "Sun",
    },
    "Taurus": {
      false: "Uranus",
      true: "Lilith",
    },
    "Gemini": {
      false: "Mars",
      true: "Sun",
    },
    "Cancer": {
      false: "Neptune",
      true: "Moon",
    },
    "Leo": {
      false: "Pluto",
      true: "Mercury",
    },
    "Virgo": {
      false: "Jupiter",
      true: "Sun",
    },
    "Libra": {
      false: "Pluto",
      true: "Jupiter",
    },
    "Scorpio": {
      false: "Jupiter",
      true: "Pluto",
    },
    "Sagittarius": {
      false: "Lilith",
      true: "Venus",
    },
    "Capricorn": {
      false: "Selene",
      true: "Uranus",
    },
    "Aquarius": {
      false: "Selene",
      true: "Neptune",
    },
    "Pisces": {
      false: "Lilith",
      true: "Saturn",
    },
  },
  "Pisces": {
    "Aries": {
      false: "Pluto",
      true: "Mercury",
    },
    "Taurus": {
      false: "Saturn",
      true: "Jupiter",
    },
    "Gemini": {
      false: "Moon",
      true: "Mercury",
    },
    "Cancer": {
      false: "Uranus",
      true: "Neptune",
    },
    "Leo": {
      false: "Mars",
      true: "Moon",
    },
    "Virgo": {
      false: "Mars",
      true: "Mercury",
    },
    "Libra": {
      false: "Mercury",
      true: "Selene",
    },
    "Scorpio": {
      false: "Jupiter",
      true: "Neptune",
    },
    "Sagittarius": {
      false: "Mercury",
      true: "Uranus",
    },
    "Capricorn": {
      false: "Moon",
      true: "Venus",
    },
    "Aquarius": {
      false: "Mars",
      true: "Sun",
    },
    "Pisces": {
      false: "Mercury",
      true: "Sun",
    },
  },
  "Aries": {
    "Aries": {
      false: "Lilith",
      true: "Mars",
    },
    "Taurus": {
      false: "Lilith",
      true: "Mercury",
    },
    "Gemini": {
      false: "Neptune",
      true: "Lilith",
    },
    "Cancer": {
      false: "Lilith",
      true: "Uranus",
    },
    "Leo": {
      false: "Saturn",
      true: "Selene",
    },
    "Virgo": {
      false: "Pluto",
      true: "Selene",
    },
    "Libra": {
      false: "Lilith",
      true: "Neptune",
    },
    "Scorpio": {
      false: "Lilith",
      true: "Mars",
    },
    "Sagittarius": {
      false: "Selene",
      true: "Saturn",
    },
    "Capricorn": {
      false: "Sun",
      true: "Jupiter",
    },
    "Aquarius": {
      false: "Lilith",
      true: "Venus",
    },
    "Pisces": {
      false: "Selene",
      true: "Uranus",
    },
  },
  "Taurus": {
    "Aries": {
      false: "Venus",
      true: "Jupiter",
    },
    "Taurus": {
      false: "Mars",
      true: "Venus",
    },
    "Gemini": {
      false: "Lilith",
      true: "Moon",
    },
    "Cancer": {
      false: "Mars",
      true: "Mercury",
    },
    "Leo": {
      false: "Lilith",
      true: "Sun",
    },
    "Virgo": {
      false: "Lilith",
      true: "Neptune",
    },
    "Libra": {
      false: "Mars",
      true: "Venus",
    },
    "Scorpio": {
      false: "Venus",
      true: "Mercury",
    },
    "Sagittarius": {
      false: "Saturn",
      true: "Neptune",
    },
    "Capricorn": {
      false: "Pluto",
      true: "Mercury",
    },
    "Aquarius": {
      false: "Mars",
      true: "Selene",
    },
    "Pisces": {
      false: "Venus",
      true: "Moon",
    },
  },
  "Gemini": {
    "Aries": {
      false: "Selene",
      true: "Moon",
    },
    "Taurus": {
      false: "Selene",
      true: "Neptune",
    },
    "Gemini": {
      false: "Jupiter",
      true: "Mercury",
    },
    "Cancer": {
      /// yeah, exactly like it
      /// because Cancer governed by a Moon
      false: "Lilith",
      true: "Selene",
    },
    "Leo": {
      false: "Lilith",
      true: "Mars",
    },
    "Virgo": {
      false: "Jupiter",
      true: "Saturn",
    },
    "Libra": {
      false: "Selene",
      true: "Saturn",
    },
    "Scorpio": {
      false: "Selene",
      true: "Moon",
    },
    "Sagittarius": {
      false: "Moon",
      true: "Jupiter",
    },
    "Capricorn": {
      false: "Mars",
      true: "Selene",
    },
    "Aquarius": {
      false: "Mercury",
      true: "Moon",
    },
    "Pisces": {
      false: "Saturn",
      true: "Jupiter",
    },
  },
  "Cancer": {
    "Aries": {
      false: "Saturn",
      true: "Uranus",
    },
    "Taurus": {
      false: "Pluto",
      true: "Uranus",
    },
    "Gemini": {
      false: "Pluto",
      true: "Selene",
    },
    "Cancer": {
      false: "Saturn",
      true: "Venus",
    },
    "Leo": {
      false: "Saturn",
      true: "Jupiter",
    },
    "Virgo": {
      false: "Selene",
      true: "Mercury",
    },
    "Libra": {
      false: "Jupiter",
      true: "Lilith",
    },
    "Scorpio": {
      false: "Saturn",
      true: "Uranus",
    },
    "Sagittarius": {
      false: "Mars",
      true: "Selene",
    },
    "Capricorn": {
      false: "Lilith",
      true: "Saturn",
    },
    "Aquarius": {
      false: "Pluto",
      true: "Jupiter",
    },
    "Pisces": {
      false: "Uranus",
      true: "Selene",
    },
  },
  "Leo": {
    "Aries": {
      false: "Jupiter",
      true: "Saturn",
    },
    "Taurus": {
      false: "Jupiter",
      true: "Selene",
    },
    "Gemini": {
      false: "Venus",
      true: "Mars",
    },
    "Cancer": {
      false: "Selene",
      true: "Uranus",
    },
    "Leo": {
      false: "Uranus",
      true: "Sun",
    },
    "Virgo": {
      false: "Lilith",
      true: "Saturn",
    },
    "Libra": {
      false: "Sun",
      true: "Mercury",
    },
    "Scorpio": {
      false: "Lilith",
      true: "Mars",
    },
    "Sagittarius": {
      false: "Mercury",
      true: "Moon",
    },
    "Capricorn": {
      false: "Moon",
      true: "Sun",
    },
    "Aquarius": {
      false: "Sun",
      true: "Uranus",
    },
    "Pisces": {
      false: "Mars",
      true: "Venus",
    },
  },
  "Virgo": {
    "Aries": {
      false: "Uranus",
      true: "Selene",
    },
    "Taurus": {
      false: "Moon",
      true: "Saturn",
    },
    "Gemini": {
      false: "Saturn",
      true: "Pluto",
    },
    "Cancer": {
      false: "Sun",
      true: "Mars",
    },
    "Leo": {
      false: "Selene",
      true: "Venus",
    },
    "Virgo": {
      false: "Neptune",
      true: "Moon",
    },
    "Libra": {
      false: "Neptune",
      true: "Uranus",
    },
    "Scorpio": {
      false: "Jupiter",
      true: "Saturn",
    },
    "Sagittarius": {
      false: "Mercury",
      true: "Neptune",
    },
    "Capricorn": {
      false: "Uranus",
      true: "Lilith",
    },
    "Aquarius": {
      false: "Saturn",
      true: "Jupiter",
    },
    "Pisces": {
      false: "Mars",
      true: "Venus",
    },
  },
  "Libra": {
    "Aries": {
      false: "Venus",
      true: "Pluto",
    },
    "Taurus": {
      false: "Pluto",
      true: "Sun",
    },
    "Gemini": {
      false: "Neptune",
      true: "Uranus",
    },
    "Cancer": {
      false: "Venus",
      true: "Pluto",
    },
    "Leo": {
      false: "Uranus",
      true: "Neptune",
    },
    "Virgo": {
      false: "Pluto",
      true: "Venus",
    },
    "Libra": {
      false: "Pluto",
      true: "Saturn",
    },
    "Scorpio": {
      false: "Venus",
      true: "Pluto",
    },
    "Sagittarius": {
      false: "Saturn",
      true: "Uranus",
    },
    "Capricorn": {
      false: "Pluto",
      true: "Venus",
    },
    "Aquarius": {
      false: "Moon",
      true: "Lilith",
    },
    "Pisces": {
      false: "Venus",
      true: "Pluto",
    },
  },
  "Scorpio": {
    "Aries": {
      false: "Neptune",
      true: "Mars",
    },
    "Taurus": {
      false: "Mars",
      true: "Venus",
    },
    "Gemini": {
      false: "Jupiter",
      true: "Saturn",
    },
    "Cancer": {
      false: "Lilith",
      true: "Sun",
    },
    "Leo": {
      false: "Neptune",
      true: "Sun",
    },
    "Virgo": {
      false: "Jupiter",
      true: "Mars",
    },
    "Libra": {
      false: "Mars",
      true: "Venus",
    },
    "Scorpio": {
      false: "Neptune",
      true: "Selene",
    },
    "Sagittarius": {
      false: "Uranus",
      true: "Pluto",
    },
    "Capricorn": {
      false: "Jupiter",
      true: "Lilith",
    },
    "Aquarius": {
      false: "Neptune",
      true: "Venus",
    },
    "Pisces": {
      false: "Saturn",
      true: "Jupiter",
    },
  },
  "Sagittarius": {
    "Aries": {
      false: "Sun",
      true: "Uranus",
    },
    "Taurus": {
      false: "Sun",
      true: "Pluto",
    },
    "Gemini": {
      false: "Uranus",
      true: "Neptune",
    },
    "Cancer": {
      false: "Jupiter",
      true: "Saturn",
    },
    "Leo": {
      false: "Mercury",
      true: "Uranus",
    },
    "Virgo": {
      false: "Venus",
      true: "Mercury",
    },
    "Libra": {
      false: "Saturn",
      true: "Jupiter",
    },
    "Scorpio": {
      false: "Lilith",
      true: "Jupiter",
    },
    "Sagittarius": {
      false: "Saturn",
      true: "Jupiter",
    },
    "Capricorn": {
      false: "Lilith",
      true: "Moon",
    },
    "Aquarius": {
      false: "Lilith",
      true: "Uranus",
    },
    "Pisces": {
      false: "Pluto",
      true: "Neptune",
    },
  },
};
