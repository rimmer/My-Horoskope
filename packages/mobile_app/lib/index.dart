import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'theme/app_theme.dart';

//
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:provider/provider.dart';
export 'package:users_repository_flutter/users_repository_flutter.dart';
export 'package:polls_repository_flutter/polls_repository_flutter.dart';
export 'package:prophecy_to_show_storage_flutter/prophecy_to_show_storage_flutter.dart';
export 'package:auth_flutter/auth_flutter.dart';

export 'blocs/simple_bloc_delegate.dart';
export 'single_provider.dart';
//
export 'screens/daily/screen/screen.dart';
export 'screens/registration/screen.dart';
export 'screens/loading.dart';
import 'screens/daily/screen/screen.dart';
import 'screens/menu/screen/screen.dart';
import 'screens/settings/screen.dart';

Container imageBackground({@required Widget child, @required String asset}) =>
    Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          ),
        ),
        child: child);

MaterialApp myProphet({@required Widget authResolver}) => MaterialApp(
      title: lang.appName,
      theme: appTheme,
      routes: {
        "/daily": (BuildContext context) => DailyScreen(),
        "/menu": (BuildContext context) => MenuScreen(),
        "/settings": (BuildContext context) => ProfileSettingsScreen(),
      },
      home: authResolver,
    );
