import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algorithm/algorithm.dart';
import 'package:authentication/bloc.dart';
import 'package:poll_availability/poll_availability.dart';
import 'package:provider/provider.dart';
import 'package:user_poll/bloc.dart';
import 'package:pollbydate_flutter/pollbydate_flutter.dart';
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
            if (state is Authenticated) {
              final sessionAlgroithm = Algorithm(
                  dat: AlgoData(
                      // if user want use AI
                      pollAvailability: PollAvailability(value: true),
                      // user previous polls
                      pollByDateRepo: PollByDateRepositoryFlutter(),
                      // user that logged in
                      user: state.user));

              return Provider<Algorithm>(
                  create: (context) => sessionAlgroithm,
                  child: BlocProvider<UserPollBloc>(
                    create: (context) => UserPollBloc(
                        currentPoll: sessionAlgroithm.dat.currentPoll),
                    child: DailyScreen(),
                  ));
            }
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
