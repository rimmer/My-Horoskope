import '../interface.dart';

part 'prediction.dart';

class EnglishLocale implements Locale {
  final String addAmbiance = "add ambiance";
  final String apply = "apply";
  final String appName = "My Prophet";
  final String atLeastXsymbolsNeeded = "symbols needed: ";
  final String adsCardDescription =
      "To see the prediction,\nplease watch the ad -\nit will support us.\nThank you.";
  final String watchAdsButton = "watch ad";
  final String birthdate = "date of birth";
  final String clarifyForecast = "Choose your Tarot cards for today";
  final String dateNotFilled = 'Fill your birthdate';
  final String datomorrow = "day after tomorrow";
  final String female = "female";
  final String futureDays =
      "Indicators may change after further refinement of the forecast";
  final String horoscope = "horoscope";
  final String horoscopeFor = "horoscope for";
  final String impact = "impact";
  final String impactHint =
      "The red planet affects you negatively during this period, and the blue planet affects you positively";
  final String male = "male";
  final String my = "my";
  final String name = "name";
  final String nameNotFilled = 'Fill "Name" field';
  final String noAmbianceButton = "do it";
  final String noAmbianceDescription =
      "It will be something! You can add a spouse, relatives, employees, friends and see the forecast for relationships with them for every day!";
  final String noAmbianceTitle = "we are working on it";
  final String notification = "notification";
  final String notificationAt = "notification at";
  final String notSelectedSex = "choose";
  final String other = "other";
  final String personalInformation = "personal information";
  final String planetImpact = "planet impact";
  final String privacyPolicy = "privacy policy";
  final String profileSettings = "profile settings";
  final String propheciesToDisplay = "prophecies to display";
  final String rateApp = "rate";
  final String save = "save";
  final String sex = "sex";
  final String start = "start";
  final String termsAccept = "I accept terms of";
  final String termsAreNotAccepted =
      "Read the user agreement and privacy policy";
  final String termsPrivacyPolicy = "privacy policy";
  final String termsUserAgreement = "user agreement";
  final String today = "today";
  final String tomorrow = "tomorrow";
  final String understood = "understood";
  final String userAgreement = "user agreement";
  final String writeToDev = "write to developer";
  final String you = "you";
  final String yourProphecies = "your prophecies";
  final String yourPropheciesHint =
      "Such is the fullness of your inner resources today";
  List<String> predicitonBark() => _predictionsEnglish();
  Map<int, String> get month => {
        1: "january",
        2: "february",
        3: "march",
        4: "april",
        5: "may",
        6: "june",
        7: "july",
        8: "august",
        9: "september",
        10: "october",
        11: "november",
        12: "december",
      };
  Map<String, String> get planetImpactName => {
        "Sun": "Sun",
        "Moon": "Moon",
        "Mercury": "Mercury",
        "Mars": "Mars",
        "Venus": "Venus",
        "Jupiter": "Jupiter",
        "Saturn": "Saturn",
        "Pluto": "Pluto",
        "Uranus": "Uranus",
        "Neptune": "Neptune",
        "Lilith": "Lilith",
        "Selene": "Selene",
      };
  Map<String, String> get prophecyId => const {
        "LUCK": "Luck",
        "INTERNAL_STRENGTH": "Internal Strength",
        "MOODLET": "Moodlet",
        "AMBITION": "Ambition",
        "INTUITION": "Intuition",
      };
}
