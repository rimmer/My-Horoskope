library language;

import 'src/interface.dart';
import 'src/russian.dart';

/// The module done for localization purpose

class lang {
  /// `static` fields and variable **"locale"** that can be used to switch language.
  static Locale locale = RussianLocale();

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
  static String privacyPolicy = locale.privacyPolicy;
  static String userAgreement = locale.userAgreement;
  static String start = locale.start;
  static String apply = locale.apply;
  static String atLeastXsymbolsNeeded = locale.atLeastXsymbolsNeeded;
  static String notAllFieldsFilled = locale.notAllFieldsFilled;
  static String termsAreNotAccepted = locale.termsAreNotAccepted;
  static String you = locale.you;
  static String mood = locale.mood;
  static String simple = locale.simple;
  static String extended = locale.extended;
  static String clarifyForecast = locale.clarifyForecast;
  static String rateYourYesterday = locale.rateYourYesterday;
  static Map<String, String> get prophecyId => locale.prophecyId;
  static String pollSettingsTitle = locale.pollSettingsTitle;
  static String pollSettingPollOption = locale.pollSettingPollOption;
  static String pollSettingsStudyOption = locale.pollSettingsStudyOption;
  static String pollSettingText = locale.pollSettingText;
}

/// capitalize first letter of string
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
