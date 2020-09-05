import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:prophecy/bloc/prophecy_bloc.dart';

import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app/components/prophecy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/components/poll_settings.dart';
import 'package:int_datetime/int_datetime.dart';

import 'poll_widgets.dart';

class DailyScreen extends StatelessWidget {
  int dt;
  DailyScreen({@required this.dt});
  @override
  Widget build(BuildContext context) {
    if (dt == dtDay)
      return TodayScreen(dt: dt);
    else
      return _DailyScreen(dt: dt);
  }
}

class TodayScreen extends StatelessWidget {
  int dt;
  TodayScreen({@required this.dt});
  @override
  Widget build(BuildContext context) {
    final usersRepo = context.watch<UsersRepositoryFlutter>();

    UserPollBloc userPollBloc = context.bloc<UserPollBloc>();
    ProphecyBloc prophet = context.bloc<ProphecyBloc>();

    prophet.add(CalculateProphecy(dt));
    userPollBloc.add(UserPollRestartEvent());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // @poll
            BlocBuilder<UserPollBloc, UserPollState>(
                bloc: userPollBloc,
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
                      prophet.add(ClarifyProphecy(
                          dt: dt, poll: userPollBloc.repo.todayPoll));
                      return SizedBox();

                    case UserPollIsSimpleState:
                      print("User poll is switched to simple state");
                      return PollSimpleWidget(bloc: userPollBloc);

                    case UserPollIsComplexState:
                      print("User poll is switched to complex state");
                      return PollExtendedWidget(bloc: userPollBloc);
                  }
                }),

            // @prophecies
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Prophecy(user: usersRepo.current)),
          ],
        ),
      ),
    );
  }
}

/// all other days
class _DailyScreen extends StatelessWidget {
  int dt;
  _DailyScreen({@required this.dt});
  @override
  Widget build(BuildContext context) {
    final usersRepo = context.watch<UsersRepositoryFlutter>();
    ProphecyBloc prophet = context.bloc<ProphecyBloc>();
    prophet.add(CalculateProphecy(dt));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Prophecy(user: usersRepo.current)),
          ],
        ),
      ),
    );
  }
}
