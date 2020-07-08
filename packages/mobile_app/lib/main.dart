import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:local_database/local_database.dart';

import 'blocs/blocs.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'routes.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ProphetApp());
}

class ProphetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
                  userRepository: UserRepository.createDefault(),
                )..add(AppStarted())),
        BlocProvider<PropheciesBloc>(
          create: (context) => PropheciesBloc(
            repository: PropheciesRepository(context),
          )..add(LoadProphecies()),
        )
      ], child: InitRoute());
}
