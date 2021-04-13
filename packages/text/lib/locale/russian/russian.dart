import '../interface.dart';

part 'prediction.dart';

class RussianLocale implements Locale {
  final String addAmbiance = "добавить окружение";
  final String apply = "применить";
  final String appName = "Мой Пророк";
  final String atLeastXsymbolsNeeded = "минимальное количество символов: ";
  final String adsCardDescription =
      "Чтобы увидеть совет,\nпросмотрите, пожалуйста, рекламу -\nэто поддержит наш проект.";
  final String watchAdsButton = "посмотреть рекламу";
  final String birthdate = "дата рождения";
  final String clarifyForecast = "Выберите карточки Таро на сегодня";
  final String dateNotFilled = 'Заполните дату рождения';
  final String datomorrow = "послезавтра";
  final String female = "женский";
  final String futureDays =
      "Показатели могут измениться после дальнейшего уточнения прогноза";
  final String horoscope = "гороскоп";
  final String horoscopeFor = "гороскоп на";
  final String impact = "влияние";
  final String impactHint =
      "Красная планета влияет на вас негативно в данный период, а синяя - положительно";
  final String male = "мужской";
  final String my = "мой";
  final String name = "имя";
  final String nameNotFilled = 'Заполните поле "Имя"';
  final String noAmbianceButton = "работайте";
  final String noAmbianceDescription =
      "Это будет нечто! Вы сможете добавить жену, мужа, детей, родителей, сотрудников и смотреть прогноз по взаимоотношениям с ними на каждый день!";
  final String noAmbianceTitle = "мы над этим работаем";
  final String notification = "уведомления";
  final String notificationAt = "уведомления в";
  final String notSelectedSex = "выбрать";
  final String other = "другой";
  final String personalInformation = "личная информация";
  final String planetImpact = "влияние планет";
  final String privacyPolicy = "политика конфиденциальности";
  final String profileSettings = "настройки профиля";
  final String propheciesToDisplay = "отображаемые показатели";
  final String rateApp = "оценить";
  final String save = "сохранить";
  final String sex = "пол";
  final String start = "начать";
  final String termsAccept = "я принимаю условия";
  final String termsAreNotAccepted =
      "Ознакомьтесь с пользовательским соглашением и политикой конфиденциальности";
  final String termsPrivacyPolicy = "политики конфиденциальности";
  final String termsUserAgreement = "пользовательского соглашения";
  final String today = "сегодня";
  final String tomorrow = "завтра";
  final String understood = "понятно";
  final String userAgreement = "пользовательское соглашение";
  final String writeToDev = "написать разработчику";
  final String you = "вы";
  final String yourProphecies = "ваши показатели";
  final String yourPropheciesHint =
      "Такова наполненность ваших внутренних ресурсов сегодня";
  List<String> predicitonBark() => _predictionsRussian();
  Map<int, String> get month => {
        1: "январь",
        2: "февраль",
        3: "март",
        4: "апрель",
        5: "май",
        6: "июнь",
        7: "июль",
        8: "август",
        9: "сентябрь",
        10: "октябрь",
        11: "ноябрь",
        12: "декабрь",
      };
  Map<String, String> get planetImpactName => {
        "Sun": "Солнца",
        "Moon": "Луны",
        "Mercury": "Меркурия",
        "Mars": "Марса",
        "Venus": "Венеры",
        "Jupiter": "Юпитера",
        "Saturn": "Сатурна",
        "Pluto": "Плутона",
        "Uranus": "Урана",
        "Neptune": "Нептуна",
        "Lilith": "Темной Луны",
        "Selene": "Светлой Луны",
      };
  Map<String, String> get prophecyId => const {
        "LUCK": "Удача",
        "INTERNAL_STRENGTH": "Внутренняя Сила",
        "MOODLET": "Самочувствие",
        "AMBITION": "Амбиции",
        "INTUITION": "Интуиция",
      };
}
