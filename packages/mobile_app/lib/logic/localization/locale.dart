import 'package:my_horoskope/app_global.dart';
import 'package:text/text.dart';

Future chooseLocale() async {
  // the right locale has already been set during cal to `guessLocaleFromSystem`
  // hence here we have only "filtered" locales
  // currently its only `ru` and `en`, which is the default one
  if (AppGlobal.data.appPref.locale.language == "ru") {
    localeText.switchLocaleToRussian();
  } else {
    localeText.switchLocaleToEnglish();
  }

  AppGlobal.data.predictions.jobSync("clear", null);
  await AppGlobal.data.predictions.prepare();
}
