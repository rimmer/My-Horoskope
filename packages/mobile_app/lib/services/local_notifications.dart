import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_prophet/index.dart';

Future initLocalNotifications() async {
  StaticProvider.notifications.instance = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await StaticProvider.notifications.instance.initialize(initializationSettings,
      onSelectNotification: selectNotification);
}

prepareLocalNotifications() {}

/// android
Future selectNotification(String payload) async {
  /// @TODO
  // if (payload != null) {
  //   debugPrint('notification payload: $payload');
  // }
  // await Navigator.push(
  //   context,
  //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
  // );
}

/// ios
Future onDidReceiveLocalNotification(
    int id, String title, String body, String payload) async {
  /// @TODO
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) => CupertinoAlertDialog(
  //     title: Text(title),
  //     content: Text(body),
  //     actions: [
  //       CupertinoDialogAction(
  //         isDefaultAction: true,
  //         child: Text('Ok'),
  //         onPressed: () async {
  //           Navigator.of(context, rootNavigator: true).pop();
  //           await Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => SecondScreen(payload),
  //             ),
  //           );
  //         },
  //       )
  //     ],
  //   ),
  // );
}
