library language;

import 'package:meta/meta.dart';
import 'src/interface.dart';

class Language {
  String languageCode;
  Locale _locale;
  Locale get tr => _locale;

  void loadLocale(
      {@required Map<String, Object> json, @required String languageCode}) {
    this.languageCode = languageCode;
    _locale = Locale.fromJson(json);
  }
}
