import 'package:flutter/material.dart';
import 'package:text/text.dart';
import 'theme/app_theme.dart';
import 'package:bloc/bloc.dart';

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

Container imageBackground({@required Widget child}) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: StaticAsset.rust["background"],
        fit: BoxFit.cover,
      ),
    ),
    child: child);

MaterialApp myProphet({@required Widget authResolver}) => MaterialApp(
      title: localeText.appName,
      theme: appTheme,
      routes: {
        "/daily": (BuildContext context) => DailyScreen(),
        "/menu": (BuildContext context) => MenuScreen(),
        "/settings": (BuildContext context) => ProfileSettingsScreen(),
      },
      home: authResolver,
    );

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
