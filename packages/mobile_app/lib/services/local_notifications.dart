import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:text/text.dart';
import 'package:flutter/widgets.dart';
import 'package:timezone/timezone.dart' as tz;
import 'static_provider.dart';

/// @constants
const _DEFAULT_PAYLOAD = "/daily";

class Notif {
  static const reminderChannel = NotificationChannelInfo(
    "remind", // id
    "Reminder", // name that displayed in smartphone settings
    "Notifications channel for reminders.", // description
    defaultEventId: 2500, // event id
  );
}

/// @syntax_sugar
FlutterLocalNotificationsPlugin get localNotifications =>
    StaticProvider.notifications.instance;

Future<List<PendingNotificationRequest>> get pendingNotifications async =>
    await localNotifications.pendingNotificationRequests();

@immutable
class NotificationChannelInfo {
  final String id;

  /// defaultEventId can be used to delete notifications for only one channel
  final int defaultEventId;
  final String name;
  final String description;
  const NotificationChannelInfo(this.id, this.name, this.description,
      {@required this.defaultEventId});
}

Future createNotificationChannel(NotificationChannelInfo channelInfo) async {
  var androidNotificationChannel = AndroidNotificationChannel(
    channelInfo.id,
    channelInfo.name,
    channelInfo.description,
  );
  await localNotifications
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidNotificationChannel);
}

Future cancelNotification(int id) async => await localNotifications.cancel(id);

/// @functionality
Future initLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('notifications_icon_color');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await localNotifications.initialize(
    initializationSettings,
  );

  if (StaticProvider.debug.isDebug)
    print("Local notifications were initialized");
}

Future timeoutNotification({
  String title = "",
  String body = "",
  String payload = _DEFAULT_PAYLOAD,
  @required NotificationChannelInfo channelInfo,
  @required Duration timeout,
  bool sound = false,
  int eventId,
}) async {
  /// if no special event id == default channel id
  /// else add channel id to custom id
  /// for example 3 + defaultId,
  /// it can help to search and cancel channel-specific notifications
  if (eventId == null)
    eventId = channelInfo.defaultEventId;
  else
    eventId += channelInfo.defaultEventId;

  if (title.isEmpty) title = localeText.appName;

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    channelInfo.id,
    channelInfo.name,
    channelInfo.description,
    playSound: sound,
  );
  final IOSNotificationDetails iOSPlatformChannelSpecifics =
      IOSNotificationDetails(presentSound: sound);

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  await localNotifications.zonedSchedule(
    eventId,
    title,
    body,
    tz.TZDateTime.now(tz.local).add(timeout),
    platformChannelSpecifics,
    payload: payload,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}

Future suddenNotification({
  String title = "",
  String body = "",
  String payload = _DEFAULT_PAYLOAD,
  @required NotificationChannelInfo channelInfo,
  bool sound = false,
  int eventId,
}) async {
  /// if no special event id == default channel id
  /// else add channel id to custom id
  /// for example 3 + defaultId,
  /// it can help to search and cancel channel-specific notifications
  if (eventId == null)
    eventId = channelInfo.defaultEventId;
  else
    eventId += channelInfo.defaultEventId;

  if (title.isEmpty) title = localeText.appName;

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    channelInfo.id,
    channelInfo.name,
    channelInfo.description,
    playSound: sound,
  );
  final IOSNotificationDetails iOSPlatformChannelSpecifics =
      IOSNotificationDetails(presentSound: sound);

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  await localNotifications.show(
    eventId,
    title,
    body,
    platformChannelSpecifics,
    payload: payload,
  );
}
