import 'locale/interface.dart';
import 'locale/russian/russian.dart';
import 'locale/ukrainian/ukrainian.dart';
import 'locale/english/english.dart';

/// The module done for localization purpose

class localeText {
  /// `static` fields and variable **"locale"** that can be used to switch language.
  static Locale locale;

  static List<String> predicitonBark() => locale.predicitonBark();

  static Map<String, String> get planetImpactName => locale.planetImpactName;
  static Map<String, String> get prophecyId => locale.prophecyId;
  static Map<int, String> get month => locale.month;
  static String addAmbiance = locale.addAmbiance;
  static String appName = locale.appName;
  static String apply = locale.apply;
  static String atLeastXsymbolsNeeded = locale.atLeastXsymbolsNeeded;
  static String adsCardDescription = locale.adsCardDescription;
  static String watchAdsButton = locale.watchAdsButton;
  static String birthdate = locale.birthdate;
  static String clarifyForecast = locale.clarifyForecast;
  static String dateNotFilled = locale.dateNotFilled;
  static String datomorrow = locale.datomorrow;
  static String female = locale.female;
  static String futureDays = locale.futureDays;
  static String horoscope = locale.horoscope;
  static String horoscopeFor = locale.horoscopeFor;
  static String impact = locale.impact;
  static String impactHint = locale.impactHint;
  static String male = locale.male;
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
  static String planetImpact = locale.planetImpact;
  static String privacyPolicy = locale.privacyPolicy;
  static String profileSettings = locale.profileSettings;
  static String propheciesToDisplay = locale.propheciesToDisplay;
  static String rateApp = locale.rateApp;
  static String save = locale.save;
  static String sex = locale.sex;
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
  static String you = locale.you;
  static String yourProphecies = locale.yourProphecies;
  static String yourPropheciesHint = locale.yourPropheciesHint;

  static switchLocaleToRussian() => localeText.locale = RussianLocale();
  static switchLocaleToUkrainian() => localeText.locale = UkrainianLocale();
  static switchLocaleToEnglish() => localeText.locale = EnglishLocale();
}

extension StringExtension on String {
  /// capitalize first letter of string
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
