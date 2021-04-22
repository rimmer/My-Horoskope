import 'index.dart';

void main() async {
  /// Ensures that all objects here are initialized before doing runApp
  /// also allows to use async
  WidgetsFlutterBinding.ensureInitialized();

  /// language
  chooseLocale();

  /// data init and load
  StaticProvider.data.appPref = AppPreferencesFlutter();
  await StaticProvider.data.appPref.load();
  StaticProvider.data.predictions = PredictionsFlutterMobile();
  await StaticProvider.data.predictions.prepare();

  /// firebase
  var app = await Firebase.initializeApp();
  app.setAutomaticDataCollectionEnabled(StaticProvider.debug.isNotDebug);
  if (StaticProvider.debug.isNotDebug) {
    StaticProvider.firebase.analytics = FirebaseAnalytics();

    StaticProvider.firebase.messaging = FirebaseMessaging.instance;
    StaticProvider.firebase.notifications =
        await StaticProvider.firebase.messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  /// ads
  MobileAds.instance.initialize();

  /// authetication
  StaticProvider.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  /// app start
  runApp(appBuilder());
}

Widget appBuilder() => imageBackground(
      child: myProphet(
        authResolver: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          //
          bloc: StaticProvider.authBloc,
          builder: (context, state) {
            //

            if (state is Authenticated) {
              StaticProvider.data.usersRepo =
                  StaticProvider.authBloc.auth.repository;

              StaticProvider.prophecyBloc = ProphecyBloc(
                algo: Algorithm(
                  dat: AlgoData(
                    usersRepository: StaticProvider.data.usersRepo,
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
    );
