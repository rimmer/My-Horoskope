part of 'screen.dart';

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

extension DailyScreenBuilders on _DailyScreenState {
  Widget dayToWidget(BuildContext context, int index) {
    ///
    if (index == dayToIndex["TODAY"]) {
      /// first element in the list

      //
      return Row(children: [
        SizedBox(width: 16),
        (dayToIndex["TODAY"] == selected)
            ? selectedDate(d[index])
            : GestureDetector(
                onTap: () {
                  widget.currentIndex.wrapped = index;
                  setState(() {});
                },
                child: ordinaryDate(d[index]),
              )
      ]);
      //

    } else if (d[index - 1].year != d[index].year) {
      /// happy new year
      return Container(
        width: CALENDAR_NEW_YEAR_WIDTH,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: yearSeparator(d[index])),
            //

            Flexible(
              child: (index == selected)
                  ? newYearDateSelected(d[index])
                  : GestureDetector(
                      onTap: () {
                        widget.currentIndex.wrapped = index;
                        setState(() {});
                      },
                      child: newYearDate(d[index]),
                    ),
            ),
          ],
        ),
      );

      //
    } else if (d[index - 1].month != d[index].month) {
      /// new month
      return Container(
        width: CALENDAR_NEW_MONTH_WIDTH,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: monthSeparator()),
            //

            Flexible(
              child: (index == selected)
                  ? newMonthDateSelected(d[index])
                  : GestureDetector(
                      onTap: () {
                        widget.currentIndex.wrapped = index;
                        setState(() {});
                      },
                      child: newMonthDate(d[index]),
                    ),
            ),
          ],
        ),
      );

      //
    }

    //
    if (index == selected)
      return selectedDate(d[index]);
    else
      return GestureDetector(
        onTap: () {
          widget.currentIndex.wrapped = index;
          setState(() {});
        },
        child: ordinaryDate(d[index]),
      );
  }

  Widget userPollBuilder(BuildContext context, UserPollState state) {
    switch (state.runtimeType) {

      /// I am adding debug prints, jsut in case

      case UserPollLoadingState:
        print("User polls are loading.");
        return SpinKitPulse(
          color: AppColors.accentDark,
          size: 32,
        );

      case UserPollIsDisabled:
        print("User polls are disabled for current user");
        return PollSettings();

      case UserPollIsVotedState:
        print("User poll is voted");
        sp.prophecyBloc.add(ClarifyProphecy(
            dt: selected, poll: sp.userPollBloc.repo.todayPoll));
        return SizedBox();

      case UserPollIsSimpleState:
        print("User poll is switched to simple state");
        return PollSimpleWidget(bloc: sp.userPollBloc);

      case UserPollIsComplexState:
        print("User poll is switched to complex state");
        return PollExtendedWidget(bloc: sp.userPollBloc);
    }
  }

  Widget prophecyBuilder(BuildContext context, ProphecyState state) {
    //
    if (state is ProphecyInitial) {
      return prophecyIsLoading(user: dat.user, birthRow: dat.birthRow);
      //

    } else if (state is ProphecyWasAsked || state is ProphecyWasClarified) {
      //
      /// if sum points of all prophecies equal or more then SWITCH_POSITIVE_PLANET_AT_SUM
      /// change positive planet to a user patron planet,
      if (state.propheciesSum >= SWITCH_POSITIVE_PLANET_AT_SUM)
        dat.currentPlanets[true] = dat.userPatron;

      //
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dat.labelStr,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 32,
            child: dat.birthRow,
          ),
          //

          prophecyRecord(
              prophecy: state.prophecy[ProphecyType.INTERNAL_STRENGTH],
              planetVariants: dat.currentPlanets),
          prophecyRecord(
              prophecy: state.prophecy[ProphecyType.MOODLET],
              planetVariants: dat.currentPlanets),
          prophecyRecord(
              prophecy: state.prophecy[ProphecyType.AMBITION],
              planetVariants: dat.currentPlanets),
          prophecyRecord(
              prophecy: state.prophecy[ProphecyType.INTELLIGENCE],
              planetVariants: dat.currentPlanets),
          //
          prophecyRecord(
              prophecy: state.prophecy[ProphecyType.LUCK],
              planetVariants: dat.currentPlanets),
        ],
        //
      );
    } else {
      return Center(
        child: Text("Error"),
      );
    }
  }
}
