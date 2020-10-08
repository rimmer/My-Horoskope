/// It is an interface and must be implemented by language files
/// It has getters of `String` or `Map<Strng,String>`.

abstract class Locale {
  String get name;
  String get birthdate;
  String get birthcountry;
  String get birthplace;
  String get sex;
  String get male;
  String get female;
  String get other;
  String get notSelectedSex;
  String get termsAccept;
  String get privacyPolicy;
  String get userAgreement;
  String get start;
  String get apply;
  String get atLeastXsymbolsNeeded;
  String get notAllFieldsFilled;
  String get termsAreNotAccepted;
  String get you;
  String get mood;
  String get simple;
  String get extended;
  String get clarifyForecast;
  String get rateYourYesterday;
  String get productivity;
  String get relationships;
  String get selfdevelopment;
  String get physicalActivity;
  Map<String, String> get prophecyId;
  String get pollSettingsTitle;
  String get pollSettingPollOption;
  String get pollSettingsStudyOption;
  String get pollSettingText;
  String get impact;
  Map<String, String> get planetImpact;
}
