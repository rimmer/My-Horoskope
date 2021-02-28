part of '../screen.dart';

String appBarLabel({@required int selected, @required DateTime dateTime}) {
  String label = "";

  if (dayToIndex["TODAY"] == selected)
    label = lang.today;
  else if (dayToIndex["TOMORROW"] == selected)
    label = lang.tomorrow;
  else if (dayToIndex["DAY AFTER TOMORROW"] == selected)
    label = lang.datomorrow;
  else {
    label = "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  }

  return "${lang.horoscopeFor.capitalize()} $label";
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
            ? selectedDate(d[index])
            : FlatButton(
                onPressed: () {
                  widget.currentIndex.wrapped = index;
                  setState(() {});
                },
                child: ordinaryDate(d[index]),
              )
      ]);
      //

    } else if (d[index - 1].month != d[index].month) {
      /// new month
      if (index == selected)
        return newMonthSelected(d[index]);
      else
        return FlatButton(
          onPressed: () {
            widget.currentIndex.wrapped = index;
            setState(() {});
          },
          child: newMonth(d[index]),
        );

      //
    }

    //
    if (index == selected)
      return selectedDate(d[index]);
    else
      return FlatButton(
        onPressed: () {
          widget.currentIndex.wrapped = index;
          setState(() {});
        },
        child: ordinaryDate(d[index]),
      );
  }
}
