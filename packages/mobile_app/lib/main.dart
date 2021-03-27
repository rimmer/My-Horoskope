import 'index.dart';

void main() async {
  /// Ensures that all objects here are initialized before doing runApp
  /// also allows to use async
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  final singleProvider = SingleProvider();

  singleProvider.appPref = AppPreferencesFlutter();
  await singleProvider.appPref.load();
  singleProvider.predictions = PredictionsFlutterMobile();
  await singleProvider.predictions.prepare();

  singleProvider.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  runApp(appBuilder(singleProvider));
}

Widget appBuilder(SingleProvider singleProvider) => Provider<SingleProvider>(
      create: (_) => singleProvider,
      child: imageBackground(
        child: myProphet(
          authResolver: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            //
            bloc: singleProvider.authBloc,
            builder: (context, state) {
              //

              if (state is Authenticated) {
                singleProvider.usersRepo =
                    singleProvider.authBloc.auth.repository;

                singleProvider.prophecyBloc = ProphecyBloc(
                  algo: Algorithm(
                    dat: AlgoData(
                      usersRepository: singleProvider.usersRepo,
                    ),
                  ),
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
