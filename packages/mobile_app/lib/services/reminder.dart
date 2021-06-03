import 'package:my_prophet/services/static_provider.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:text/text.dart';
import 'local_notifications.dart';

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
  if (StaticProvider.data.appPref.dat.notifications.disabled == false)
    for (_Remind reminder in reminders)
      await timeoutNotification(
        channelInfo: Notif.reminderChannel,
        timeout: reminder.duration,

        /// @DEBUG dont delete me please
        // timeout: Duration(seconds: (reminder.id + 2) * 10),
        body: reminder.customText == false
            ? await getPredictionText(
                DateTime.now().add(reminder.duration).millisecondsSinceEpoch,
              )
            : localeText.locale.youAreBusyNotif,
        eventId: reminder.id,
        payload: reminder.payload,
      );
}

Future<String> getPredictionText(int atDay) async {
  final biggestProphecyType = StaticProvider.prophecyBloc.algo
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
    StaticProvider.data.usersRepo.current.model.birth,
  );

  switch (biggestProphecyType) {
    case ProphecyType.AMBITION:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveAmbition(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
    case ProphecyType.INTUITION:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveIntelligence(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
    case ProphecyType.LUCK:
      predictionText = StaticProvider.data.predictions.predictionPositiveLuck(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
    case ProphecyType.MOODLET:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveMoodlet(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;

    case ProphecyType.INTERNAL_STRENGTH:
    default:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveInternalStr(
        {
          'birthDate': birthDate,
          'dateNow': dateNow,
        },
      );
      break;
  }

  return predictionText;
}
