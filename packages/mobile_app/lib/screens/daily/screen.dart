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

import 'poll_widgets.dart';

class DailyScreen extends StatelessWidget {
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
