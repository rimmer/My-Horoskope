import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'exports_for_main.dart';
import 'firebase_options.dart';

void main() async {
  /// Ensures that all objects here are initialized before doing runApp
  /// also allows to use async
  WidgetsFlutterBinding.ensureInitialized();

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
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  app.setAutomaticDataCollectionEnabled(AppGlobal.debug.isNotDebug);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  AppGlobal.firebase.analytics = FirebaseAnalytics.instance;
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
  initAds(onLoaded: () {
    AppGlobal.ads.adsLoaded = true;
  }, onWatched: () {
    AppGlobal.ads.adsWatched = true;
  }, onFailed: (error) {
    AppGlobal.ads.adsLoaded = false;
  });

  final notificationFuture = initLocalNotifications()
      .then((_) => createNotificationChannel(NotificationChannel.reminderChannel));

  /// authentication
  AppGlobal.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());

  await Future.wait([
    notificationFuture,
    assets,
  ]);

  //
  runApp(const _Root());
}

class _Root extends StatelessWidget {
  const _Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrecacheAssets.rustLoad(context);

    return CardsLogic(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: localeText.appName,
        theme: appTheme,
        initialRoute: AppPath.auth,
        onGenerateRoute: AppPath.generateRoute,
      ),
    );
  }
}
