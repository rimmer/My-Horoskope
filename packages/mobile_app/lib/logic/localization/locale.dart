import 'dart:io' show Platform;
import 'package:my_horoskope/app_global.dart';
import 'package:text/text.dart';

Future chooseLocale() async {
  var languageCode;
  if (AppGlobal.data.appPref.dat.locale.language != "none")
    languageCode = AppGlobal.data.appPref.locale.language;
  else
    languageCode = Platform.localeName.split('_')[0];

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
