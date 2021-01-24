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
        sp.prophecyBloc.add(CalculateProphecy(dtDay));
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
    print(dat.labelStr);
    if (state is ProphecyInitial) {
      return prophecyIsLoading();
      //

    } else if (state is ProphecyWasAsked || state is ProphecyWasClarified) {
      //
      /// if sum points of all prophecies equal or more then SWITCH_POSITIVE_PLANET_AT_SUM
      /// change positive planet to a user patron planet,
      if (state.propheciesSum >= SWITCH_POSITIVE_PLANET_AT_SUM)
        dat.currentPlanets[true] = dat.userPatron;

      if (isToday) {
        /// if is today, can add the text

        final birthDate = DateTime.fromMillisecondsSinceEpoch(
            sp.usersRepo.current.model.birth);

        if (toShow.internalStrength == true &&
            toShow.moodlet == true &&
            toShow.ambition == true &&
            toShow.intuition == true &&
            toShow.luck == true) {
          /// if all prophecies are enabled
          /// we show text for biggest and least prophecies,
          /// if they are not neutral valued

          final least = state.prophecy.least;
          final biggest = state.prophecy.biggest;

          String negativePredictionText =
              negativePrediction(type: least, birthDate: birthDate);

          if (state.prophecy[least].value <= DEFAULT_NEGATIVE_PROPHECY_BOUND)
            state.prophecy.addText(id: least, text: negativePredictionText);

          String positivePredictionText =
              positivePrediction(type: biggest, birthDate: birthDate);

          if (state.prophecy[biggest].value >= DEFAULT_POSITIVE_PROPHECY_BOUND)
            state.prophecy.addText(id: biggest, text: positivePredictionText);
        } else {
          /// if some prophecies are disabled,
          /// we show text to any prophecy that
          /// bigger or lesser then some value bound
          for (var prophecy in state.prophecy.values) {
            if (prophecy.value >= TWEAKED_POSITIVE_PROPHECY_BOUND) {
              //

              String text =
                  positivePrediction(type: prophecy.id, birthDate: birthDate);

              state.prophecy.addText(id: prophecy.id, text: text);
              //
            } else if (prophecy.value <= TWEAKED_NEGATIVE_PROPHECY_BOUND) {
              //

              String text =
                  negativePrediction(type: prophecy.id, birthDate: birthDate);

              state.prophecy.addText(id: prophecy.id, text: text);
              //
            }
          }
        }
      }

      //
      return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: PROPHECY_PADDING_HORIZONTAL),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          //

          Text(
            dat.labelStr,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 32,
            child: dat.birthRow,
          ),
          //

          (toShow.internalStrength)
              ? prophecyRecord(
                  prophecy: state.prophecy[ProphecyType.INTERNAL_STRENGTH],
                  planetVariants: dat.currentPlanets)
              : SizedBox(),
          (toShow.moodlet)
              ? prophecyRecord(
                  prophecy: state.prophecy[ProphecyType.MOODLET],
                  planetVariants: dat.currentPlanets)
              : SizedBox(),
          (toShow.ambition)
              ? prophecyRecord(
                  prophecy: state.prophecy[ProphecyType.AMBITION],
                  planetVariants: dat.currentPlanets)
              : SizedBox(),
          (toShow.intuition)
              ? prophecyRecord(
                  prophecy: state.prophecy[ProphecyType.INTUITION],
                  planetVariants: dat.currentPlanets)
              : SizedBox(),
          (toShow.luck)
              ? prophecyRecord(
                  prophecy: state.prophecy[ProphecyType.LUCK],
                  planetVariants: dat.currentPlanets)
              : SizedBox(),
          //
          //
          /// if all prophecies are disabled show internal strength
          (toShow.internalStrength == false &&
                  toShow.moodlet == false &&
                  toShow.ambition == false &&
                  toShow.intuition == false &&
                  toShow.luck == false)
              ? prophecyRecord(
                  prophecy: state.prophecy[ProphecyType.INTERNAL_STRENGTH],
                  planetVariants: dat.currentPlanets)
              : SizedBox(),
        ],
        //
      );
    } else {
      return Center(
        child: Text("Error"),
      );
    }
  }

  String positivePrediction(
      {@required ProphecyType type, @required DateTime birthDate}) {
    String positivePredictionText;

    switch (type) {
      case ProphecyType.AMBITION:
        positivePredictionText = //
            sp.predictions.predictionPositiveAmbition(
          birthDate,
        );
        break;
      case ProphecyType.INTUITION:
        positivePredictionText =
            //
            sp.predictions.predictionPositiveIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.LUCK:
        positivePredictionText = //
            sp.predictions.predictionPositiveLuck(
          birthDate,
        );
        break;
      case ProphecyType.MOODLET:
        positivePredictionText = //
            sp.predictions.predictionPositiveMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.INTERNAL_STRENGTH:
      default:
        positivePredictionText =
            //
            sp.predictions.predictionPositiveInternalStr(
          birthDate,
        );
        break;
    }

    return positivePredictionText;
  }

  String negativePrediction(
      {@required ProphecyType type, @required DateTime birthDate}) {
    String negativePredictionText;

    switch (type) {
      case ProphecyType.AMBITION:
        negativePredictionText = //
            sp.predictions.predictionNegativeAmbition(
          birthDate,
        );
        break;
      case ProphecyType.INTUITION:
        negativePredictionText =
            //
            sp.predictions.predictionNegativeIntelligence(
          birthDate,
        );
        break;
      case ProphecyType.LUCK:
        negativePredictionText = //
            sp.predictions.predictionNegativeLuck(
          birthDate,
        );
        break;
      case ProphecyType.MOODLET:
        negativePredictionText = //
            sp.predictions.predictionNegativeMoodlet(
          birthDate,
        );
        break;

      case ProphecyType.INTERNAL_STRENGTH:
      default:
        negativePredictionText =
            //
            sp.predictions.predictionNegativeInternalStr(
          birthDate,
        );
        break;
    }

    return negativePredictionText;
  }
}
