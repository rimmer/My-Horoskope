part of '../screen.dart';

String appBarLabel({@required int selected, @required DateTime dateTime}) {
  String label = "";

  if (dayToIndex["TODAY"] == selected)
    label = localeText.today;
  else if (dayToIndex["TOMORROW"] == selected)
    label = localeText.tomorrow;
  else if (dayToIndex["DAY AFTER TOMORROW"] == selected)
    label = localeText.datomorrow;
  else {
    label = "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  }

  return "${localeText.horoscopeFor.capitalize()} $label";
}

extension DailyScreenCalendarBuilder on _DailyScreenState {
  Widget dayToWidget(BuildContext context, int index) {
    ///
    if (index == dayToIndex["TODAY"]) {
      /// first element in the list

      //
      return Row(children: [
        SizedBox(width: 16),
        (dayToIndex["TODAY"] == selected)
            ? (dat.showCalendarSelection)
                ? selectedDate(d[index])
                : ordinaryDate(d[index])
            : TextButton(
                onPressed: () => calendarTap(index),
                child: ordinaryDate(d[index]),
              )
      ]);
      //

    } else if (d[index - 1].month != d[index].month) {
      /// new month
      if (index == selected)
        return (dat.showCalendarSelection)
            ? newMonthSelected(d[index])
            : newMonth(d[index]);
      else
        return TextButton(
          onPressed: () => calendarTap(index),
          child: newMonth(d[index]),
        );

      //
    }

    //
    if (index == selected)
      return (dat.showCalendarSelection)
          ? selectedDate(d[index])
          : ordinaryDate(d[index]);
    else
      return TextButton(
        onPressed: () => calendarTap(index),
        child: ordinaryDate(d[index]),
      );
  }
}
