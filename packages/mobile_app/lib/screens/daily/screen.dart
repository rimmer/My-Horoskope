import 'package:flutter/material.dart';
import 'package:prophecy/bloc/prophecy_bloc.dart';

import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app/components/prophecy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/components/poll_settings.dart';
import 'package:int_datetime/int_datetime.dart';

import 'poll_widgets.dart';

class DailyScreen extends StatelessWidget {
  int dt;
  DailyScreen({@required this.dt});
  @override
  Widget build(BuildContext context) {
    final usersRepo = context.watch<UsersRepositoryFlutter>();
    int currentDay = dtDay;

    UserPollBloc userPollBloc;
    if (dt == currentDay) userPollBloc = context.bloc<UserPollBloc>();

    ProphecyBloc prophet = context.bloc<ProphecyBloc>();
    prophet.add(CalculateProphecy(dt));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // @poll
            (dt == currentDay)
                ? BlocBuilder<UserPollBloc, UserPollState>(
                    bloc: userPollBloc,
                    builder: (context, state) {
                      if (state.enabled == false) return PollSettings();
                      if (state is UserPollChanged) {
                        return (userPollBloc.isSimple)
                            ? PollSimpleWidget(bloc: userPollBloc)
                            : PollExtendedWidget(bloc: userPollBloc);
                      }
                      return PollSimpleWidget(bloc: userPollBloc);
                    })
                : SizedBox(),
            // @prophecies
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Prophecy(user: usersRepo.current)),
            ),
          ],
        ),
      ),
    );
  }
}
