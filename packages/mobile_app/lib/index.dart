// import 'dart:io' show Platform;
import 'package:flutter/material.dart';
// import 'package:my_prophet/services/single_provider.dart';
import 'package:text/text.dart';
import 'theme/app_theme.dart';
import 'screens/daily/screen/screen.dart';
import 'screens/menu/screen.dart';
import 'screens/settings/screen.dart';
import 'services/static_assets.dart';

//
export 'services/single_provider.dart';
export 'package:provider/provider.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:base/user/auth/data/flutter_auth.dart';
export 'package:base/preferences/flutter_default.dart';
export 'package:my_prophet/services/predictions.dart';
export 'package:base/user/repository/flutter_default/flutter_default.dart';
export 'package:algorithm/algorithm.dart';
export 'screens/daily/screen/screen.dart';
export 'screens/registration/screen.dart';
export 'screens/loading.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
export 'package:firebase_messaging/firebase_messaging.dart';

MaterialApp myProphet({
  @required Widget authResolver,
  // @required SingleProvider sp,
}) {
  return MaterialApp(
    title: localeText.appName,
    theme: appTheme,
    routes: {
      "/daily": (BuildContext context) => DailyScreen(),
      "/menu": (BuildContext context) => MenuScreen(),
      "/settings": (BuildContext context) => ProfileSettingsScreen(),
    },
    home: authResolver,
  );
}

Container imageBackground({@required Widget child}) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: StaticAsset.rust["background"],
        fit: BoxFit.cover,
      ),
    ),
    child: child);

chooseLocale() {
  /// @TODO, add predictions
  // final languageCode = Platform.localeName.split('_')[0];

  // switch (languageCode) {
  //   case "uk":
  //     localeText.switchLocaleToUkrainian();
  //     break;

  //   case "ru":
  //     localeText.switchLocaleToRussian();
  //     break;

  //   case "en":
  //   default:
  //     localeText.switchLocaleToEnglish();
  //     break;
  // }
  localeText.switchLocaleToRussian();
}
