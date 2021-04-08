import 'index.dart';

void main() async {
  /// Ensures that all objects here are initialized before doing runApp
  /// also allows to use async
  WidgetsFlutterBinding.ensureInitialized();

  /// language
  chooseLocale();

  /// file loads and init
  final singleProvider = SingleProvider();

  if (singleProvider.debug.isDebug)
    BlocSupervisor.delegate = SimpleBlocDelegate();

  singleProvider.appPref = AppPreferencesFlutter();
  await singleProvider.appPref.load();
  singleProvider.predictions = PredictionsFlutterMobile();
  await singleProvider.predictions.prepare();

  /// firebase
  if (singleProvider.debug.isNotDebug) {
    await Firebase.initializeApp();
    singleProvider.firebase.analytics = FirebaseAnalytics();
  }

  /// authetication
  singleProvider.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  /// app start
  runApp(appBuilder(singleProvider));
}

Widget appBuilder(SingleProvider singleProvider) => Provider<SingleProvider>(
      create: (_) => singleProvider,
      child: imageBackground(
        child: myProphet(
          // sp: singleProvider,
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
