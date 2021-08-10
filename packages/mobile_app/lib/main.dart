import 'index.dart';

void main() async {
  /// Ensures that all objects here are initialized before doing runApp
  /// also allows to use async
  WidgetsFlutterBinding.ensureInitialized();

  // Measure startup time
  // Stopwatch initTime = Stopwatch()..start();

  await dotenv.load(fileName: "assets/.env");
  final assets = PrecacheAssets.startSvgLoad();

  /// Application Preferences init
  AppGlobal.data.appPref = AppPreferencesFlutter();
  await AppGlobal.data.appPref.load();

  /// predictions init and load, language locale
  AppGlobal.data.predictions = PredictionsFlutterMobile();
  await chooseLocale();

  /// timezone configuration
  await configureLocalTimeZone();

  /// firebase
  final app = await Firebase.initializeApp();
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
  final initAd = initAds(onLoaded: (manager) {
    AppGlobal.ads.adsAreLoaded = true;
    AppGlobal.ads.manager = manager;
  }, onWatched: () {
    AppGlobal.ads.adsAreWatched = true;
  }, onFailed: (error) {
    AppGlobal.ads.adsAreLoaded = false;
  });

  final notificationFuture = initLocalNotifications()
      .then((_) => createNotificationChannel(Notif.reminderChannel));

  /// authentication
  AppGlobal.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  await Future.wait([
    notificationFuture,
    assets,
    initAd,
  ]);

  // print("Initialization took ${initTime.elapsed}");

  //
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
