import 'index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final singleProvider = SingleProvider();
  singleProvider.show = ProphecyToShowStorageFlutter();
  singleProvider.predictions = PredictionsFlutterMobile();
  singleProvider.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(appBuilder(singleProvider));
}

Widget appBuilder(SingleProvider singleProvider) => Provider<SingleProvider>(
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
