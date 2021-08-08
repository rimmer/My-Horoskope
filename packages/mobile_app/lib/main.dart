import 'index.dart';

void main() async {
  /// Ensures that all objects here are initialized before doing runApp
  /// also allows to use async
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");
  await PrecacheAssets.svgLoad();

  /// Application Preferences init
  AppGlobal.data.appPref = AppPreferencesFlutter();
  await AppGlobal.data.appPref.load();

  /// predictions init and load, language locale
  AppGlobal.data.predictions = PredictionsFlutterMobile();
  await chooseLocale();

  /// timezone configuration
  await configureLocalTimeZone();

  /// firebase
  var app = await Firebase.initializeApp();
  app.setAutomaticDataCollectionEnabled(AppGlobal.debug.isNotDebug);
  AppGlobal.firebase.analytics = FirebaseAnalytics();
  AppGlobal.firebase.analytics
      .setAnalyticsCollectionEnabled(AppGlobal.debug.isNotDebug);
  if (AppGlobal.debug.isNotDebug) {
    AppGlobal.firebase.messaging = FirebaseMessaging.instance;
    AppGlobal.firebase.notifications =
        await AppGlobal.firebase.messaging.requestPermission(
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
  AppGlobal.internetAvailable = await internetCheck();

  if (AppGlobal.internetAvailable)
    await initAds(
      onLoaded: (manager) {
        AppGlobal.ads.manager = manager;
      },
      onWatched: () {
        AppGlobal.ads.adsAreWatched = true;
      },
    );

  await initLocalNotifications();
  await createNotificationChannel(Notif.reminderChannel);

  await initLocalNotifications();
  await createNotificationChannel(Notif.reminderChannel);

  /// authetication
  AppGlobal.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  runApp(const _Root());
}

class _Root extends StatelessWidget {
  const _Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrecacheAssets.rustLoad(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: localeText.appName,
      theme: appTheme,
      initialRoute: AppPath.auth,
      onGenerateRoute: AppPath.generateRoute,
    );
  }
}
