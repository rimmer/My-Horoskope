import 'package:my_horoskope/app_global.dart';
import 'package:text/text.dart';

Future chooseLocale() async {
  var languageCode = AppGlobal.data.appPref.locale.language;

  switch (languageCode) {
    case "ru":
    case "be":
    case "kk":
    case "ky":
    case "tg":
    case "uz":
    case "ce":
    case "ab":
    case "ro":
    case "uk":
      localeText.switchLocaleToRussian();
      break;

    case "en":
    default:
      localeText.switchLocaleToEnglish();
      break;
  }

  AppGlobal.data.predictions.jobSync("clear", null);
  await AppGlobal.data.predictions.prepare();
}
