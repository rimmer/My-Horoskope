import 'locale/interface.dart';
import 'locale/russian/russian.dart';

/// The module done for localization purpose

class localeText {
  /// `static` fields and variable **"locale"** that can be used to switch language.
  static Locale locale = RussianLocale();

  static List<String> predicitonBark() => locale.predicitonBark();

  static Map<String, String> get planetImpactName => locale.planetImpactName;
  static Map<String, String> get prophecyId => locale.prophecyId;
  static Map<int, String> get month => locale.month;
  static String addAmbiance = locale.addAmbiance;
  static String appName = locale.appName;
  static String apply = locale.apply;
  static String atLeastXsymbolsNeeded = locale.atLeastXsymbolsNeeded;
  static String birthcountry = locale.birthcountry;
  static String birthdate = locale.birthdate;
  static String birthplace = locale.birthplace;
  static String calendarHint = locale.calendarHint;
  static String clarifyForecast = locale.clarifyForecast;
  static String dateNotFilled = locale.dateNotFilled;
  static String datomorrow = locale.datomorrow;
  static String extended = locale.extended;
  static String female = locale.female;
  static String futureDays = locale.futureDays;
  static String horoscope = locale.horoscope;
  static String horoscopeFor = locale.horoscopeFor;
  static String impact = locale.impact;
  static String impactHint = locale.impactHint;
  static String male = locale.male;
  static String mood = locale.mood;
  static String my = locale.my;
  static String name = locale.name;
  static String nameNotFilled = locale.nameNotFilled;
  static String noAmbianceButton = locale.noAmbianceButton;
  static String noAmbianceDescription = locale.noAmbianceDescription;
  static String noAmbianceTitle = locale.noAmbianceTitle;
  static String notSelectedSex = locale.notSelectedSex;
  static String notification = locale.notification;
  static String notificationAt = locale.notificationAt;
  static String other = locale.other;
  static String personalInformation = locale.personalInformation;
  static String physicalActivity = locale.physicalActivity;
  static String planetImpact = locale.planetImpact;
  static String privacyPolicy = locale.privacyPolicy;
  static String productivity = locale.productivity;
  static String profileSettings = locale.profileSettings;
  static String propheciesToDisplay = locale.propheciesToDisplay;
  static String rateApp = locale.rateApp;
  static String rateYourYesterday = locale.rateYourYesterday;
  static String relationships = locale.relationships;
  static String save = locale.save;
  static String selfdevelopment = locale.selfdevelopment;
  static String sex = locale.sex;
  static String simple = locale.simple;
  static String start = locale.start;
  static String termsAccept = locale.termsAccept;
  static String termsAreNotAccepted = locale.termsAreNotAccepted;
  static String termsPrivacyPolicy = locale.termsPrivacyPolicy;
  static String termsUserAgreement = locale.termsUserAgreement;
  static String today = locale.today;
  static String tomorrow = locale.tomorrow;
  static String understood = locale.understood;
  static String userAgreement = locale.userAgreement;
  static String writeToDev = locale.writeToDev;
  static String yesterdayMood = locale.yesterdayMood;
  static String you = locale.you;
  static String yourProphecies = locale.yourProphecies;
  static String yourPropheciesHint = locale.yourPropheciesHint;
}

extension StringExtension on String {
  /// capitalize first letter of string
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension LocaleChange on localeText {
  switchLocaleToRussian() => localeText.locale = RussianLocale();
}
