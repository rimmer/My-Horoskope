import '../interface.dart';

part 'prediction.dart';

class UkrainianLocale implements Locale {
  final String addAmbiance = "додати оточення";
  final String apply = "застосувати";
  final String appName = "Мій Провидець";
  final String atLeastXsymbolsNeeded = "найменша кількість символів: ";
  final String adsCardDescription =
      "Щоб побачити передбачення,\nгляньте, будь ласка, рекламу -\nце допоможе нашому проекту.";
  final String watchAdsButton = "подивитися рекламу";
  final String birthdate = "дата народження";
  final String clarifyForecast = "Оберіть картки Таро на цей день";
  final String dateNotFilled = 'Дата народження пуста';
  final String datomorrow = "післязавтра";
  final String female = "жіноча";
  final String futureDays =
      "Показники можуть змінитися після уточнення прогнозу";
  final String horoscope = "гороскоп";
  final String horoscopeFor = "гороскоп на";
  final String impact = "вплив";
  final String impactHint =
      "Червона планета впливає на вас негативно в цей період, а синя - позитивно";
  final String male = "чоловіча";
  final String my = "мій";
  final String name = "ім\'я";
  final String nameNotFilled = 'Заповніть поле "Ім\'я"';
  final String noAmbianceButton = "працюйте";
  final String noAmbianceDescription =
      "Це буде щось! Ви зможете додати дружину, чоловіка, дітей, батьків, співробітників та дивитися прогноз по взаємовідносинах з ними на кожен день!";
  final String noAmbianceTitle = "ми над цим працюємо";
  final String notification = "сповіщення";
  final String notificationAt = "сповіщення о";
  final String notSelectedSex = "обрати";
  final String other = "інша";
  final String personalInformation = "особисте";
  final String planetImpact = "вплив планет";
  final String privacyPolicy = "політика конфіденційності";
  final String profileSettings = "налаштування профілю";
  final String propheciesToDisplay = "показувати такі передбачення";
  final String rateApp = "оцінити";
  final String save = "зберегти";
  final String sex = "стать";
  final String start = "почати";
  final String termsAccept = "я приймаю умови";
  final String termsAreNotAccepted =
      "Ознайомтесь з угодою користувача і політикою конфіденційності";
  final String termsPrivacyPolicy = "політики конфіденційності";
  final String termsUserAgreement = "угоди користувача";
  final String today = "сьогодні";
  final String tomorrow = "завтра";
  final String understood = "зрозуміло";
  final String userAgreement = "угода користувача";
  final String writeToDev = "написати розробнику";
  final String you = "ви";
  final String yourProphecies = "ваші показники";
  final String yourPropheciesHint =
      "Такою є наповненість ваших внутрішніх ресурсів сьогодні";
  List<String> predicitonBark() => _predictionsUkrainian();
  Map<int, String> get month => {
        1: "січень",
        2: "лютий",
        3: "березень",
        4: "квітень",
        5: "травень",
        6: "червень",
        7: "липень",
        8: "серпень",
        9: "вересень",
        10: "жовтень",
        11: "листопад",
        12: "грудень",
      };
  Map<String, String> get planetImpactName => {
        "Sun": "Сонця",
        "Moon": "Місяця",
        "Mercury": "Меркурія",
        "Mars": "Марса",
        "Venus": "Венери",
        "Jupiter": "Юпітера",
        "Saturn": "Сатурна",
        "Pluto": "Плутона",
        "Uranus": "Урана",
        "Neptune": "Нептуна",
        "Lilith": "Темного Місяця",
        "Selene": "Світлого Місяця",
      };
  Map<String, String> get prophecyId => const {
        "LUCK": "Вдача",
        "INTERNAL_STRENGTH": "Внутрішня Сила",
        "MOODLET": "Самопочуття",
        "AMBITION": "Амбіції",
        "INTUITION": "Інтуїція",
      };
}
