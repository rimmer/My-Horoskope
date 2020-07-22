import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication/bloc.dart';
import 'screens/registration/screen.dart';
import 'screens/daily/screen.dart';
import 'screens/monthly/screen.dart';
import 'screens/settings/screen.dart';
import 'screens/loading.dart';
import 'theme/app_theme.dart';

class InitRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authBloc = context.bloc<AuthenticationBloc>();

    return MaterialApp(
      title: 'My Prophet',
      theme: appTheme,
      routes: routes,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: authBloc,
          builder: (context, state) {
            if (state is Authenticated) return DailyScreen();
            if (state is Unauthenticated) {
              return RegistrationScreen();
            }
            return LoadingScreen();
          }),
    );
  }

  final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    "/settings": (BuildContext context) => SettingsScreen(),
    "/daily": (BuildContext context) => DailyScreen(),
    "/monthly": (BuildContext context) => MonthlyScreen(),
  };
}
