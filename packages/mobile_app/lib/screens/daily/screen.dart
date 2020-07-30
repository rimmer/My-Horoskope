import 'package:flutter/material.dart';

import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app/components/prophecy.dart';
import 'package:algorithm/algorithm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/components/poll_settings.dart';

import 'poll_widgets.dart';

class DailyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserPollBloc userPollBloc = context.bloc<UserPollBloc>();
    final usersRepo = context.watch<UsersRepositoryFlutter>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // @poll
            BlocBuilder<UserPollBloc, UserPollState>(
                bloc: userPollBloc,
                builder: (context, state) {
                  if (state.enabled == false) return PollSettings();
                  if (state is UserPollChanged) {
                    return (userPollBloc.isSimple)
                        ? PollSimpleWidget(bloc: userPollBloc)
                        : PollExtendedWidget(bloc: userPollBloc);
                  }
                  return PollSimpleWidget(bloc: userPollBloc);
                }),
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
