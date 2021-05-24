// import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_prophet/index.dart';
import 'package:text/text.dart';
import 'package:flutter/widgets.dart';
import 'static_provider.dart';

@immutable
class NotificationChannelInfo {
  final String id;
  final String name;
  final String description;
  const NotificationChannelInfo(this.id, this.name, this.description);
}

Future initLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('notifications_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await StaticProvider.notifications.instance.initialize(
    initializationSettings,
  );

  if (StaticProvider.debug.isDebug)
    print("Local notifications were initialized");
}

Future createNotificationChannel(NotificationChannelInfo channelInfo) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var androidNotificationChannel = AndroidNotificationChannel(
    channelInfo.id,
    channelInfo.name,
    channelInfo.description,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidNotificationChannel);
}

Future suddenNotification({
  String title = "",
  String body = "",
  String payload = "my_prophet_daily_screen",
  @required NotificationChannelInfo channelInfo,
}) async {
  if (title.isEmpty) title = localeText.appName;

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          channelInfo.id, channelInfo.name, channelInfo.description,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  final NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await StaticProvider.notifications.instance
      .show(0, title, body, platformChannelSpecifics, payload: payload);
}
