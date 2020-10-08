import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algorithm/algorithm.dart';
import 'package:authentication/bloc.dart';
import 'package:prophecy/bloc.dart';
import 'package:user_poll/bloc.dart';
import 'package:polls_repository_flutter/polls_repository_flutter.dart';
import 'package:int_datetime/int_datetime.dart';
import 'screens/registration/screen.dart';
import 'screens/daily/screen.dart';
import 'screens/monthly/screen.dart';
import 'screens/settings/screen.dart';
import 'screens/loading.dart';
import 'theme/app_theme.dart';

final Map<String, WidgetBuilder> initialRoutes = <String, WidgetBuilder>{
  "/settings": (BuildContext context) => SettingsScreen(),
  "/daily": (BuildContext context) => DailyScreen(dt: dtDay),
  "/monthly": (BuildContext context) => MonthlyScreen(),
};

MaterialApp appBuilder(
    {@required AuthenticationBloc authBloc,
    @required Map<String, WidgetBuilder> routes}) {
  return MaterialApp(
    title: 'My Prophet',
    theme: appTheme,
    routes: routes,
    home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: authBloc,
        builder: (context, state) {
          //
          if (state is Authenticated) {
            //

            final usersRepo = authBloc.auth.repository;
            final pollsRepo = PollsRepositoryFlutter();

            final dtToShow = DateTime.utc(2020, 25, 10).millisecondsSinceEpoch;

            //

            final sessionAlgroithm = Algorithm(
                dat: AlgoData(
                    pollByDateRepo: pollsRepo,
                    //
                    usersRepository: usersRepo));

            //

            return MultiBlocProvider(
              providers: [
                BlocProvider<UserPollBloc>(
                  create: (context) => UserPollBloc(
                    repo: pollsRepo,
                    users: usersRepo,
                  ),
                ),
                BlocProvider<ProphecyBloc>(
                  create: (context) => ProphecyBloc(
                    algo: sessionAlgroithm,
                  ),
                ),
              ],
              // child: DailyScreen(dt: dtDay),
              child: DailyScreen(dt: dtToShow),
            );

            //

            //
          }
          if (state is Unauthenticated) {
            return RegistrationScreen();
          }
          return LoadingScreen();
        }),
  );
}
