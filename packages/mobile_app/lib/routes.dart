import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algorithm/algorithm.dart';
import 'package:authentication/bloc.dart';
import 'package:prophecy/bloc.dart';
import 'package:provider/provider.dart';
import 'package:user_poll/bloc.dart';
import 'package:polls_repository_flutter/polls_repository_flutter.dart';
import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:int_datetime/int_datetime.dart';
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
            //
            if (state is Authenticated) {
              //

              //

              final usersRepo = context.watch<UsersRepositoryFlutter>();
              final pollsRepo = PollsRepositoryFlutter();

              //

              final sessionAlgroithm = Algorithm(
                  dat: AlgoData(
                      pollByDateRepo: pollsRepo,
                      //
                      usersRepository: usersRepo));

              //

              return Provider<Algorithm>(
                create: (context) => sessionAlgroithm,
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider<UserPollBloc>(
                      create: (context) => UserPollBloc(
                        enabled: usersRepo.current.pollAvailability,
                        pollsRepo: pollsRepo,
                      ),
                    ),
                    BlocProvider<ProphecyBloc>(
                      create: (context) => ProphecyBloc(
                        algo: sessionAlgroithm,
                      ),
                    ),
                  ],
                  child: DailyScreen(dt: dtNow),
                ),
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

  final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    "/settings": (BuildContext context) => SettingsScreen(),
    "/daily": (BuildContext context) => DailyScreen(dt: dtDay),
    "/monthly": (BuildContext context) => MonthlyScreen(),
  };
}
