library language;

import 'src/interface.dart';
import 'src/russian.dart';

/// The module done for localization purpose

class lang {
  /// `static` fields and variable **"locale"** that can be used to switch language.
  static Locale locale = RussianLocale();

  /// Bark annalogy from the tree bark
  static List<String> predicitonBark() => locale.predicitonBark();

  static String name = locale.name;
  static String birthdate = locale.birthdate;
  static String birthcountry = locale.birthcountry;
  static String birthplace = locale.birthplace;
  static String sex = locale.sex;
  static String male = locale.male;
  static String female = locale.female;
  static String other = locale.other;
  static String notSelectedSex = locale.notSelectedSex;
  static String termsAccept = locale.termsAccept;
  static String termsPrivacyPolicy = locale.termsPrivacyPolicy;
  static String termsUserAgreement = locale.termsUserAgreement;
  static String start = locale.start;
  static String apply = locale.apply;
  static String atLeastXsymbolsNeeded = locale.atLeastXsymbolsNeeded;
  static String notAllFieldsFilled = locale.notAllFieldsFilled;
  static String termsAreNotAccepted = locale.termsAreNotAccepted;
  static String you = locale.you;
  static String my = locale.my;
  static String mood = locale.mood;
  static String simple = locale.simple;
  static String extended = locale.extended;
  static String clarifyForecast = locale.clarifyForecast;
  static String rateYourYesterday = locale.rateYourYesterday;
  static String productivity = locale.productivity;
  static String relationships = locale.relationships;
  static String selfdevelopment = locale.selfdevelopment;
  static String physicalActivity = locale.physicalActivity;
  static String pollSettingsTitle = locale.pollSettingsTitle;
  static String pollSettingPollOption = locale.pollSettingPollOption;
  static String pollSettingsStudyOption = locale.pollSettingsStudyOption;
  static String pollSettingText = locale.pollSettingText;
  static String impact = locale.impact;
  static String today = locale.today;
  static String tomorrow = locale.tomorrow;
  static String datomorrow = locale.datomorrow;
  static String horoscope = locale.horoscope;
  static String horoscopeFor = locale.horoscopeFor;
  static String addAmbiance = locale.addAmbiance;
  static String profileSettings = locale.profileSettings;
  static String notification = locale.notification;
  static String notificationAt = locale.notificationAt;
  static String writeToDev = locale.writeToDev;
  static String rateApp = locale.rateApp;
  static String privacyPolicy = locale.privacyPolicy;
  static String userAgreement = locale.userAgreement;
  static String personalInformation = locale.personalInformation;
  static String propheciesToDisplay = locale.propheciesToDisplay;
  static String save = locale.save;
  static String noAmbianceTitle = locale.noAmbianceTitle;
  static String noAmbianceDescription = locale.noAmbianceDescription;
  static String noAmbianceButton = locale.noAmbianceButton;
  static Map<int, String> get month => locale.month;
  static Map<String, String> get planetImpact => locale.planetImpact;
  static Map<String, String> get prophecyId => locale.prophecyId;
}

/// capitalize first letter of string
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
