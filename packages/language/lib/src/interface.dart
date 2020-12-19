/// It is an interface and must be implemented by language files
/// It has getters of `String` or `Map<Strng,String>`.

abstract class Locale {
  /// Bark annalogy from the tree bark
  List<String> predicitonBark();

  //
  String get addAmbiance;
  String get apply;
  String get appName;
  String get atLeastXsymbolsNeeded;
  String get birthcountry;
  String get birthdate;
  String get birthplace;
  String get clarifyForecast;
  String get datomorrow;
  String get extended;
  String get female;
  String get horoscope;
  String get horoscopeFor;
  String get impact;
  String get male;
  Map<int, String> get month;
  String get mood;
  String get my;
  String get name;
  String get noAmbianceButton;
  String get noAmbianceDescription;
  String get noAmbianceTitle;
  String get nameNotFilled;
  String get dateNotFilled;
  String get notification;
  String get notificationAt;
  String get notSelectedSex;
  String get other;
  String get personalInformation;
  String get physicalActivity;
  Map<String, String> get planetImpact;
  String get pollSettingPollOption;
  String get pollSettingsStudyOption;
  String get pollSettingsTitle;
  String get pollSettingText;
  String get privacyPolicy;
  String get productivity;
  String get profileSettings;
  String get propheciesToDisplay;
  Map<String, String> get prophecyId;
  String get rateApp;
  String get rateYourYesterday;
  String get relationships;
  String get save;
  String get selfdevelopment;
  String get sex;
  String get simple;
  String get start;
  String get termsAccept;
  String get termsAreNotAccepted;
  String get termsPrivacyPolicy;
  String get termsUserAgreement;
  String get today;
  String get tomorrow;
  String get userAgreement;
  String get writeToDev;
  String get you;
  String get futureDays;
}
