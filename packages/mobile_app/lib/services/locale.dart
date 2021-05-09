import 'dart:io' show Platform;
import 'static_provider.dart';
import 'package:text/text.dart';

Future chooseLocale() async {
  var languageCode;
  if (StaticProvider.data.appPref.dat.locale.language != "none")
    languageCode = StaticProvider.data.appPref.locale.language;
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

  StaticProvider.data.predictions.jobSync("clear", null);
  await StaticProvider.data.predictions.prepare();
}
