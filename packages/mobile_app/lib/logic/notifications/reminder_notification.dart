import 'package:my_prophet/app_global.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:text/text.dart';
import 'notifications_config.dart';

class _Remind {
  final Duration duration;
  final int id;
  final bool customText;
  final String payload;
  const _Remind(
      {this.duration, this.id, this.customText = false, this.payload});
}

Future reminderConfig() async {
  /// declare reminders
  const reminders = <_Remind>[
    const _Remind(
      id: 1,
      payload: "After 3 days",
      duration: Duration(days: 3),
    ),
    const _Remind(
      id: 2,
      payload: "After 4 days",
      duration: Duration(days: 4),
    ),
    const _Remind(
      id: 3,
      payload: "After 5 days",
      duration: Duration(days: 5),
    ),
    const _Remind(
      id: 4,
      payload: "After 6 days",
      duration: Duration(days: 6),
    ),
    const _Remind(
      id: 5,
      payload: "After 13 days",
      duration: Duration(days: 13),
    ),
    const _Remind(
      id: 6,
      payload: "After 20 days",
      duration: Duration(days: 20),
      customText: true,
    ),
  ];

  /// cancel previous
  for (_Remind reminder in reminders)
    await cancelNotification(
      reminder.id + Notif.reminderChannel.defaultEventId,
    );

  /// add new
  if (AppGlobal.data.appPref.dat.notifications.disabled == false)
    for (_Remind reminder in reminders)
      await timeoutNotification(
        channelInfo: Notif.reminderChannel,
        timeout: reminder.duration,

        /// @DEBUG dont delete me please
        // timeout: Duration(seconds: (reminder.id + 2) * 10),
        body: reminder.customText == false
            ? await _getPredictionText(
                DateTime.now().add(reminder.duration).millisecondsSinceEpoch,
              )
            : localeText.locale.youAreBusyNotif,
        eventId: reminder.id,
        payload: reminder.payload,
      );
}

Future<String> _getPredictionText(int atDay) async {
  final biggestProphecyType = AppGlobal.prophecyUtil.algo
      .ask(
        aboutDay: atDay,
        isDebug: false,
      )
      .biggest;

  String predictionText;
  DateTime dateNow = DateTime.fromMillisecondsSinceEpoch(
    atDay,
  );
  DateTime birthDate = DateTime.fromMillisecondsSinceEpoch(
    AppGlobal.data.usersRepo.current.model.birth,
  );

  switch (biggestProphecyType) {
    case ProphecyType.SOLAR:
      predictionText = AppGlobal.data.predictions.predictionPositiveAmbition(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
    case ProphecyType.THROAT:
      predictionText =
          AppGlobal.data.predictions.predictionPositiveIntelligence(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
    case ProphecyType.SACRAL:
      predictionText = AppGlobal.data.predictions.predictionPositiveLuck(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
    case ProphecyType.ROOT:
      predictionText = AppGlobal.data.predictions.predictionPositiveMoodlet(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;

    case ProphecyType.HEART:
    default:
      predictionText = AppGlobal.data.predictions.predictionPositiveInternalStr(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
  }

  return predictionText;
}
