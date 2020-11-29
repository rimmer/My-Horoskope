import 'index.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final singleProvider = SingleProvider();

    /// @TODO, we need BLoC
    singleProvider.predictions = PredictionsFlutterMobile("ru") //
      ..prepare(context);

    //

    singleProvider.authBloc = AuthenticationBloc(
        auth: AuthFlutter(repository: UsersRepositoryFlutter()))
      ..add(AppStarted());

    return Provider<SingleProvider>(
      create: (_) => singleProvider,
      child: imageBackground(
        asset: "assets/background.jpg",
        //

        child: myProphet(
          authResolver: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            //
            bloc: singleProvider.authBloc,
            builder: (context, state) {
              //

              if (state is Authenticated) {
                singleProvider.usersRepo =
                    singleProvider.authBloc.auth.repository;
                singleProvider.pollsRepo = PollsRepositoryFlutter();
                singleProvider.show = ProphecyToShowStorageFlutter();

                singleProvider.prophecyBloc = ProphecyBloc(
                  algo: Algorithm(
                    dat: AlgoData(
                      pollByDateRepo: singleProvider.pollsRepo,
                      usersRepository: singleProvider.usersRepo,
                    ),
                  ),
                );

                singleProvider.userPollBloc = UserPollBloc(
                  users: singleProvider.usersRepo,
                  repo: singleProvider.pollsRepo,
                );

                return DailyScreen();

                //
              } else if (state is Unauthenticated)
                return RegistrationScreen();
              else {
                return LoadingScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
