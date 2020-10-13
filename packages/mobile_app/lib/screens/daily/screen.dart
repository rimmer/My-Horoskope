import 'package:app/single_provider.dart';
import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:prophecy/bloc/prophecy_bloc.dart';
import 'package:provider/provider.dart';
import 'package:app/components/prophecy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/components/poll_settings.dart';
import 'package:int_datetime/int_datetime.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';

import 'poll_widgets.dart';

const _NUMBER_OF_DAYS_TO_SHOW = 1098;
//
const _indexToDay = {
  0: "TODAY",
  1: "TOMORROW",
  2: "DAY AFTER TOMORROW",
};
const _dayToIndex = {
  "TODAY": 0,
  "TOMORROW": 1,
  "DAY AFTER TOMORROW": 2,
};

class DailyScreen extends StatefulWidget {
  /// current day to show
  final currentIndex = MutableInteger(0);

  /// current and next _NUMBER_OF_DAYS_TO_SHOW days DateTime
  final List<DateTime> day = [];

  DailyScreen() {
    //
    final now = DateTime.now();

    final today = DateTime.utc(
      now.year,
      now.month,
      now.day,
    );

    day.add(today);

    /// fills the list with all other days
    for (int d = 1; d <= _NUMBER_OF_DAYS_TO_SHOW; d++)
      day.add(today.add(new Duration(days: d)));
  }

  @override
  _DailyScreenState createState() => _DailyScreenState();
}

Widget _ordinaryDate(DateTime date) {}
Widget _selectedDate(DateTime date) {}
Widget _newMonthDate(DateTime date, {@required bool isSelected}) {}
Widget _newYearDate(DateTime date, {@required bool isSelected}) {}

class _DailyScreenState extends State<DailyScreen> {
  SingleProvider sp;

  @override
  void initState() {
    sp = context.read<SingleProvider>();
    super.initState();
  }

  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //

            /// All the fun goes here

            //

            /// @CALENDAR
            SizedBox(
              height: 192,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _NUMBER_OF_DAYS_TO_SHOW,
                itemBuilder: (BuildContext context, int index) {
                  ///
                  if (index == _dayToIndex["TODAY"]) {
                    //

                    /// first element in the list
                    if (_dayToIndex["TODAY"] == selected)
                      return _selectedDate(d[index]);
                    else
                      return _ordinaryDate(d[index]);
                    //

                  } else if (d[index - 1].year != d[index].year) {
                    /// happy new year

                  } else if (d[index - 1].month != d[index].month) {
                    /// new month
                  }

                  //
                  if (index == selected)
                    return _selectedDate(d[index]);
                  else
                    return _ordinaryDate(d[index]);
                },
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}

class DailyScreenOld extends StatelessWidget {
  final dt = dtDay;

  @override
  Widget build(BuildContext context) {
    //
    final sp = context.watch<SingleProvider>();

    final bool isToday = dt == dtDay;

    sp.prophecyBloc.add(CalculateProphecy(dt));
    if (isToday) sp.userPollBloc.add(UserPollRestartEvent());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // @poll
            (isToday)
                ? BlocBuilder<UserPollBloc, UserPollState>(
                    bloc: sp.userPollBloc,
                    builder: (context, state) {
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
                              dt: dt, poll: sp.userPollBloc.repo.todayPoll));
                          return SizedBox();

                        case UserPollIsSimpleState:
                          print("User poll is switched to simple state");
                          return PollSimpleWidget(bloc: sp.userPollBloc);

                        case UserPollIsComplexState:
                          print("User poll is switched to complex state");
                          return PollExtendedWidget(bloc: sp.userPollBloc);
                      }
                    })
                : SizedBox(),

            // @prophecies
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Prophecy(user: sp.usersRepo.current, dt: dt)),
          ],
        ),
      ),
    );
  }
}
