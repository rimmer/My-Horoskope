import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prophecies_repository_flutter/prophecies_repository_flutter.dart';
import 'package:userpoll/userpoll.dart';
import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:auth_flutter/auth_flutter.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'routes.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ProphetApp());
}

class ProphetApp extends StatelessWidget {
  final usersRepository = UsersRepositoryFlutter();
  final userPoll = UserPoll(mood: 3);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<UsersRepositoryFlutter>(
              create: (context) => usersRepository),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
                auth: AuthFlutter(repository: usersRepository))
              ..add(AppStarted()),
          ),
          BlocProvider<PropheciesBloc>(
            create: (context) => PropheciesBloc(
              repository: PropheciesRepositoryFlutter(context),
            )..add(LoadProphecies()),
          ),
          BlocProvider<UserPollBloc>(
              create: (context) => UserPollBloc(currentPoll: userPoll)),
        ], child: _Background(child: InitRoute())),
      );
}

class _Background extends StatelessWidget {
  final Widget child;
  _Background({@required this.child});
  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: child);
}
