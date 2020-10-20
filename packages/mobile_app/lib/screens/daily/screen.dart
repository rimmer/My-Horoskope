/// all imports are here
import 'screen_index.dart';

class DailyScreen extends StatefulWidget {
  /// current day to show
  final currentIndex = MutableInteger(0);

  /// current and next NUMBER_OF_DAYS_TO_SHOW days DateTime
  final List<DateTime> day = [];

  DailyScreen() {
    //

    final today = DateTime.fromMillisecondsSinceEpoch(dtDay);
    day.add(today);

    /// fills the list with all other days
    for (int d = 1; d <= NUMBER_OF_DAYS_TO_SHOW; d++)
      day.add(today.add(new Duration(days: d)));
  }

  @override
  _DailyScreenState createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  SingleProvider sp;
  //
  UserEntity user;
  String labelStr;
  Row birthRow;
  String sign;
  String userPatron;
  final Map<bool, String> currentPlanets = {};

  @override
  void initState() {
    sp = context.read<SingleProvider>();
    //

    user = sp.usersRepo.current;
    labelStr = "${user.model.name.capitalize()} (${userRole(user.role)})";
    sign = user.model.birth.astroSign;
    userPatron = user.model.birth.astroHousePlanet;

    final dtConverted = user.model.birth.toDateTime;

    birthRow = Row(
      children: <Widget>[
        SvgPicture.asset("assets/icons/$sign.svg"),
        Text(" ${dtConverted.day}.${dtConverted.month}.${dtConverted.year} ",
            style: TextStyle(fontSize: 14)),
      ],
    );

    calculateProphecy();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    /// gets planets for current period
    currentPlanets
      ..clear()
      ..addAll(planetFor[d[selected].millisecondsSinceEpoch.astroSign][sign]);
    //
    final screen = MediaQuery.of(context).size;
    bool isToday = d[selected].millisecondsSinceEpoch == dtDay;

    if (isToday) startUserPollBloc();
    calculateProphecy();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            //
            /// @APPBAR
            Container(
              color: AppColors.appBarBackground,
              height: APPBAR_HEIGHT,
              width: screen.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: SizedBox(width: APPBAR_ICON_SIZE / 3)),
                  Flexible(
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.textDisabled,
                        size: APPBAR_ICON_SIZE,
                      ),
                      onPressed: () {
                        /// @TODO
                        print("Hello there!");
                      },
                    ),
                  ),
                  Flexible(child: SizedBox(width: APPBAR_BETWEEN_ICON_TEXT)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      appBarLabel(),
                      style: TextStyle(
                        fontSize: APPBAR_FONT_SIZE,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// @CALENDAR
            Container(
              color: AppColors.calendarBackground.withOpacity(0.4),
              height: CALENDAR_HEIGHT,
              width: screen.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: NUMBER_OF_DAYS_TO_SHOW,
                itemBuilder: dayToWidget,
              ),
            ),

            //

            SizedBox(
              height: SPACE_BETWEEN_CALENDAR_POLLS,
              width: screen.width,
            ),

            /// @USERPOLL
            (isToday)
                ? BlocBuilder<UserPollBloc, UserPollState>(
                    bloc: sp.userPollBloc,
                    builder: userPollStateToWidget,
                  )
                : SizedBox(),

            SizedBox(
              height: SPACE_BETWEEN_POLLS_PROPHECY,
              width: screen.width,
            ),

            /// @PROPHECY
            SizedBox(
              height: screen.height,
              width: screen.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: PROPHECY_PADDING_HORIZONTAL),
                child: BlocBuilder<ProphecyBloc, ProphecyState>(
                    bloc: sp.prophecyBloc,
                    builder: (context, state) {
                      //
                      if (state is ProphecyInitial) {
                        return prophecyIsLoading(
                            user: this.user, birthRow: birthRow);
                        //

                      } else if (state is ProphecyWasAsked ||
                          state is ProphecyWasClarified) {
                        //
                        /// if sum points of all prophecies equal or more then SWITCH_POSITIVE_PLANET_AT_SUM
                        /// change positive planet to a user patron planet,
                        if (state.propheciesSum >=
                            SWITCH_POSITIVE_PLANET_AT_SUM)
                          currentPlanets[true] = userPatron;

                        //
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              labelStr,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 32,
                              child: birthRow,
                            ),
                            //

                            prophecyRecord(
                                prophecy: state
                                    .prophecy[ProphecyType.INTERNAL_STRENGTH],
                                planetVariants: currentPlanets),
                            prophecyRecord(
                                prophecy: state.prophecy[ProphecyType.MOODLET],
                                planetVariants: currentPlanets),
                            prophecyRecord(
                                prophecy: state.prophecy[ProphecyType.AMBITION],
                                planetVariants: currentPlanets),
                            prophecyRecord(
                                prophecy:
                                    state.prophecy[ProphecyType.INTELLIGENCE],
                                planetVariants: currentPlanets),
                            //
                            prophecyRecord(
                                prophecy: state.prophecy[ProphecyType.LUCK],
                                planetVariants: currentPlanets),
                          ],
                          //
                        );
                      } else {
                        return Center(
                          child: Text("Error"),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //

  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;

  /// @APPBAR

  String appBarLabel() {
    String label = "";

    if (dayToIndex["TODAY"] == selected)
      label = lang.today;
    else if (dayToIndex["TOMORROW"] == selected)
      label = lang.tomorrow;
    else if (dayToIndex["DAY AFTER TOMORROW"] == selected)
      label = lang.datomorrow;
    else {
      label = "${d[selected].day}.${d[selected].month}.${d[selected].year}";
    }

    return "${lang.horoscopeFor.capitalize()} $label";
  }

  /// @CALENDAR
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
                  setState(() {
                    widget.currentIndex.wrapped = index;
                  });
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
          setState(() {
            widget.currentIndex.wrapped = index;
          });
        },
        child: ordinaryDate(d[index]),
      );
  }
  // dayToWidget end

  /// @USERPOLL

  Widget userPollStateToWidget(BuildContext context, UserPollState state) {
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

  /// @PROPHECY

  void calculateProphecy() {
    sp.prophecyBloc.add(CalculateProphecy(d[selected].millisecondsSinceEpoch));
  }

  void startUserPollBloc() {
    sp.userPollBloc.add(UserPollRestartEvent());
  }
}
