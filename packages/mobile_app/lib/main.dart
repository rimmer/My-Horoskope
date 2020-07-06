import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_database/local_database.dart';

import 'blocs/blocs.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'theme/app_theme.dart';
import 'views/home_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ProphetApp());
}

class ProphetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(
                    userRepository: UserRepository.createDefault(),
                  )..add(AppStarted())),
          BlocProvider<PropheciesBloc>(
            create: (context) => PropheciesBloc(
              repository: PropheciesRepository(context),
            )..add(LoadProphecies()),
          )
        ],
        child: MaterialApp(
          title: 'My Prophet',
          theme: appTheme,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) return HomeScreen();
              if (state is Unauthenticated) {
                return Center(
                  child: Text('Could not authenticate with Firestore'),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
}
