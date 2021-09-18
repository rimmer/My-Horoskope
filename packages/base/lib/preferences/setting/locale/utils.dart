import 'dart:io' show Platform;

String guessLocaleFromSystem() {
  final languageCode = Platform.localeName.split('_')[0];

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
      return "ru";

    case "en":
    default:
      return "en";
  }
}