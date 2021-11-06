import 'package:flutter/scheduler.dart';

import 'exports_for_auth_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthenticationBloc, AuthenticationState>(
        //
        bloc: AppGlobal.authBloc,
        builder: (context, state) {
          // register
          if (state is Unauthenticated) {
            return const RegistrationScreen();
          }
          // if user authenticated
          else if (state is Authenticated) {
            AppGlobal.data.usersRepo = AppGlobal.authBloc.auth.repository;
            AppGlobal.prophecyUtil = ProphecyUtility(Algorithm());
            reminderConfig();

            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/daily');
            });
          }

          // else
          return const LoadingScreen();
        },
      );
}
