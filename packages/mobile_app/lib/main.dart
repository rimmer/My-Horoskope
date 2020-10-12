import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:auth_flutter/auth_flutter.dart';

import 'blocs/simple_bloc_delegate.dart';
import 'single_provider.dart';
import 'routes.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(appBuilder());
}

Widget appBuilder() {
  final singleProvider = SingleProvider();

  singleProvider.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  return _imageBackground(
    asset: "assets/background.jpg",
    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        //
        bloc: singleProvider.authBloc,
        builder: (context, state) {
          //
          if (state is Unauthenticated)
            return myProphet(home: RegistrationScreen());

          //

          if (state is Authenticated) {
            //

            singleProvider.usersRepo = singleProvider.authBloc.auth.repository;
            singleProvider.pollsRepo = PollsRepositoryFlutter();

            singleProvider.prophecyBloc = ProphecyBloc(
              algo: Algorithm(
                  dat: AlgoData(
                      pollByDateRepo: singleProvider.pollsRepo,
                      //
                      usersRepository: singleProvider.usersRepo)),
            );

            singleProvider.userPollBloc = UserPollBloc(
              users: singleProvider.usersRepo,
              repo: singleProvider.pollsRepo,
            );

            return Provider<SingleProvider>(
              create: (_) => singleProvider,
              child: myProphet(routes: initialRoutes),
            );
          }

          // else
          return myProphet(home: LoadingScreen());
        }),
  );
}

Container _imageBackground({@required Widget child, @required String asset}) =>
    Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          ),
        ),
        child: child);

MaterialApp myProphet({Widget home, Map<String, WidgetBuilder> routes}) =>
    (home == null)
        ? MaterialApp(title: 'My Prophet', theme: appTheme, routes: routes)
        : MaterialApp(title: 'My Prophet', theme: appTheme, home: home);
