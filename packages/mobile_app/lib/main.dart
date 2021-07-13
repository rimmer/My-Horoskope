import 'index.dart';

void main() async {
  /// Ensures that all objects here are initialized before doing runApp
  /// also allows to use async
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  /// Application Preferences init
  StaticProvider.data.appPref = AppPreferencesFlutter();
  await StaticProvider.data.appPref.load();

  /// predictions init and load, language locale
  StaticProvider.data.predictions = PredictionsFlutterMobile();
  await chooseLocale();

  /// timezone configuration
  await configureLocalTimeZone();

  /// firebase
  var app = await Firebase.initializeApp();
  app.setAutomaticDataCollectionEnabled(StaticProvider.debug.isNotDebug);
  StaticProvider.firebase.analytics = FirebaseAnalytics();
  StaticProvider.firebase.analytics
      .setAnalyticsCollectionEnabled(StaticProvider.debug.isNotDebug);
  if (StaticProvider.debug.isNotDebug) {
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
  StaticProvider.internetAvailable = await internetCheck();

  if (StaticProvider.internetAvailable)
    await initAds(
      onLoaded: (manager) {
        StaticProvider.ads.manager = manager;
      },
      onWatched: () {
        StaticProvider.ads.adsAreWatched = true;
      },
    );

  await initLocalNotifications();
  await createNotificationChannel(Notif.reminderChannel);

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

              StaticProvider.prophecyUtil = ProphecyUtility(
                Algorithm(
                  dat: AlgoData(
                    usersRepository: StaticProvider.data.usersRepo,
                  ),
                ),
              );

              reminderConfig();

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
