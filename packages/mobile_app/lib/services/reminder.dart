import 'package:my_prophet/services/static_provider.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:text/text.dart';
import 'local_notifications.dart';

class _Remind {
  final Duration duration;
  final int id;
  final String text;
  const _Remind({this.duration, this.id, this.text});
}

Future reminderConfig() async {
  /// declare reminders
  const reminders = <_Remind>[
    const _Remind(
      id: 1,
      duration: Duration(seconds: 60),
      text: "I am first",
    ),
    const _Remind(
      id: 2,
      duration: Duration(seconds: 120),
      text: "I am second",
    ),
  ];

  /// cancel previous
  for (_Remind reminder in reminders)
    await cancelNotification(
      reminder.id + Notif.reminderChannel.defaultEventId,
    );

  /// add new
  for (_Remind reminder in reminders)
    await timeoutNotification(
      channelInfo: Notif.reminderChannel,
      timeout: reminder.duration,
      body: reminder.text ??
          await getPredictionText(
            DateTime.now().add(reminder.duration).millisecondsSinceEpoch,
          ),
      eventId: reminder.id,
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
  DateTime birthDate = DateTime.fromMillisecondsSinceEpoch(
    StaticProvider.data.usersRepo.current.model.birth,
  );

  switch (biggestProphecyType) {
    case ProphecyType.AMBITION:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveAmbition(
        birthDate,
      );
      break;
    case ProphecyType.INTUITION:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveIntelligence(
        birthDate,
      );
      break;
    case ProphecyType.LUCK:
      predictionText = StaticProvider.data.predictions.predictionPositiveLuck(
        birthDate,
      );
      break;
    case ProphecyType.MOODLET:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveMoodlet(
        birthDate,
      );
      break;

    case ProphecyType.INTERNAL_STRENGTH:
    default:
      predictionText =
          StaticProvider.data.predictions.predictionPositiveInternalStr(
        birthDate,
      );
      break;
  }

  return predictionText;
}
