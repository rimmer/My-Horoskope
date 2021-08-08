part of '../daily_screen.dart';

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
                ? SelectedDate(d[index])
                : OrdinaryDate(d[index])
            : TextButton(
                onPressed: () => calendarTap(index),
                child: OrdinaryDate(d[index]),
              )
      ]);
      //

    } else if (d[index - 1].month != d[index].month) {
      /// new month
      if (index == selected)
        return (dat.showCalendarSelection)
            ? NewMonthSelected(d[index])
            : NewMonth(d[index]);
      else
        return TextButton(
          onPressed: () => calendarTap(index),
          child: NewMonth(d[index]),
        );

      //
    }

    //
    if (index == selected)
      return (dat.showCalendarSelection)
          ? SelectedDate(d[index])
          : OrdinaryDate(d[index]);
    else
      return TextButton(
        onPressed: () => calendarTap(index),
        child: OrdinaryDate(d[index]),
      );
  }
}
