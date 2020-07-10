import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prophecies_flutter/prophecies_flutter.dart';
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
  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(auth: AuthFlutter())..add(AppStarted()),
        ),
        BlocProvider<PropheciesBloc>(
          create: (context) => PropheciesBloc(
            repository: PropheciesFlutter(context),
          )..add(LoadProphecies()),
        )
      ], child: InitRoute());
}
