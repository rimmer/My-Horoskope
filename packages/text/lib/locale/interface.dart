/// It is an interface and must be implemented by language files
/// It has getters of `String` or `Map<Strng,String>`.

abstract class Locale {
  List<String> predicitonBark();
  Map<String, String> get planetImpactName;
  Map<String, String> get prophecyId;
  Map<int, String> get month;
  String get addAmbiance;
  String get appName;
  String get apply;
  String get atLeastXsymbolsNeeded;
  String get adsCardDescription;
  String get watchAdsButton;
  String get birthdate;
  String get clarifyForecast;
  String get dateNotFilled;
  String get datomorrow;
  String get female;
  String get futureDays;
  String get horoscope;
  String get horoscopeFor;
  String get impact;
  String get impactHint;
  String get male;
  String get my;
  String get name;
  String get nameNotFilled;
  String get noAmbianceButton;
  String get noAmbianceDescription;
  String get noAmbianceTitle;
  String get noInternetText;
  String get noInternetButton;
  String get notSelectedSex;
  String get notification;
  String get notificationAt;
  String get other;
  String get personalInformation;
  String get planetImpact;
  String get privacyPolicy;
  String get profileSettings;
  String get propheciesToDisplay;
  String get rateApp;
  String get save;
  String get sex;
  String get start;
  String get termsAccept;
  String get termsAreNotAccepted;
  String get termsPrivacyPolicy;
  String get termsUserAgreement;
  String get today;
  String get tomorrow;
  String get understood;
  String get userAgreement;
  String get writeToDev;
  String get you;
  String get yourProphecies;
  String get yourPropheciesHint;
}
