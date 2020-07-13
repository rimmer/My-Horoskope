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
}
