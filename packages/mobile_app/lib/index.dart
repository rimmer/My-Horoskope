import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_provider.dart';
import 'package:text/text.dart';

import 'screens/daily/screen/screen.dart';
import 'screens/menu/screen.dart';
import 'screens/settings/screen.dart';
import 'services/static_assets.dart';
import 'theme/app_theme.dart';

export 'package:algorithm/algorithm.dart';
export 'package:base/cards.dart';
export 'package:base/preferences/flutter_default.dart';
export 'package:base/user/auth/data/flutter_auth.dart';
export 'package:base/user/repository/flutter_default/flutter_default.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:google_mobile_ads/google_mobile_ads.dart';
export 'package:my_prophet/services/predictions.dart';
export 'package:my_prophet/services/local_notifications.dart';

export 'screens/daily/screen/screen.dart';
export 'screens/loading.dart';
export 'screens/registration/screen.dart';
export 'services/ads.dart';
export 'services/locale.dart';
//
export 'services/static_provider.dart';
export 'services/timezone.dart';
export 'services/reminder.dart';

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
    navigatorObservers: [
      FirebaseAnalyticsObserver(analytics: StaticProvider.firebase.analytics),
    ],
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
