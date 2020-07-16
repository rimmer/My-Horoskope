library language;

import 'src/interface.dart';
import 'src/russian.dart';

class lang {
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
  static String atLeastXsymbolsNeeded = locale.atLeastXsymbolsNeeded;
  static String notAllFieldsFilled = locale.notAllFieldsFilled;
  static String termsAreNotAccepted = locale.termsAreNotAccepted;
  static String you = locale.you;
  static String mood = locale.mood;
  static String simple = locale.simple;
  static String extended = locale.extended;
  static String clarifyForecast = locale.clarifyForecast;
  static String rateYourYesterday = locale.rateYourYesterday;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
