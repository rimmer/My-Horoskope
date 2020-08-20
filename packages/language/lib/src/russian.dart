import 'interface.dart';

class RussianLocale implements Locale {
  final String name = "имя";
  final String birthdate = "дата рождения";
  final String birthcountry = "страна, в которой вы родились";
  final String birthplace = "населенный пункт, где вы родились";
  final String sex = "пол";
  final String male = "мужской";
  final String female = "женский";
  final String other = "другой";
  final String notSelectedSex = "выбрать";
  final String termsAccept = "я принимаю условия";
  final String privacyPolicy = "пользовательского соглашения";
  final String userAgreement = "политики конфиденциальности";
  final String start = "начать";
  final String apply = "применить";
  final String atLeastXsymbolsNeeded = "минимальное количество символов: ";
  final String notAllFieldsFilled = "Не все поля заполнены";
  final String termsAreNotAccepted = "Вы не приняли соглашения";
  final String you = "вы";
  final String mood = "настроение";
  final String simple = "простой";
  final String extended = "расширенный";
  final String clarifyForecast = "уточнить прогноз";
  final String rateYourYesterday = "оцените свое вчерашнее";
  final String productivity = "продуктивность";
  final String relationships = "отношения";
  final String selfdevelopment = "саморазвитие";
  final String physicalActivity = "физическая активность";
  Map<String, String> get prophecyId => const {
        "LUCK": "Удача",
        "INTERNAL_STRENGTH": "Внутренняя Сила",
        "MOODLET": "Самочувствие",
        "AMBITION": "Амбиции",
        "INTELLIGENCE": "Интеллект",
      };
  final String pollSettingsTitle = "обучение AI";
  final String pollSettingPollOption = "проводить опрос";
  final String pollSettingsStudyOption = "включить обучение AI";
  final String pollSettingText =
      "отвечая на вопросы о своем вчерашнем настроении Вы помогате обучить наш искусственный интеллект лучше прогнозировать ваше будущее.";
}
