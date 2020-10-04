import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:auth_flutter/auth_flutter.dart';

import 'blocs/blocs.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'routes.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ProphetApp());
}

class ProphetApp extends StatelessWidget {
  final authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  @override
  Widget build(BuildContext context) => BlocProvider<AuthenticationBloc>(
        create: (context) => authBloc,
        child: _background(
            child: appBuilder(authBloc: authBloc, routes: initialRoutes)),
      );
}

Container _background({@required Widget child}) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/background.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: child);
