import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prophecies_flutter/prophecies_flutter.dart';
import 'package:auth_flutter/auth_flutter.dart';
import 'package:users_flutter/users_flutter.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'routes.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ProphetApp());
}

class ProphetApp extends StatelessWidget {
  final usersStorage = UsersStorageJson();

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<UsersStorageJson>(create: (context) => usersStorage),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) =>
                AuthenticationBloc(auth: AuthFlutter(storage: usersStorage))
                  ..add(AppStarted()),
          ),
          BlocProvider<PropheciesBloc>(
            create: (context) => PropheciesBloc(
              repository: PropheciesFlutter(context),
            )..add(LoadProphecies()),
          )
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
