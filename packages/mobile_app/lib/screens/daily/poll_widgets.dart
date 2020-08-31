import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:provider/provider.dart';
import 'package:language/language.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/theme/app_colors.dart';
import 'package:algorithm/algorithm.dart';
import 'package:app/components/poll_settings.dart';
import 'package:app/components/yesterday_poll.dart';

const double BASE_POLL_HEIGHT = 192.0;

class PollSimpleWidget extends StatelessWidget {
  //
  final UserPollBloc bloc;
  PollSimpleWidget({@required this.bloc});

  //
  @override
  Widget build(BuildContext context) {
    //
    /// mutable wrappers
    final yestFeelings = bloc.pollsRepo.todayPoll;

    MutableInteger mood = MutableInteger(yestFeelings.mood.value);

    //

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(16.0),
      height: BASE_POLL_HEIGHT,
      decoration: BoxDecoration(
          color: AppColors.userPollBackground,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _UserPollTopPart(bloc: bloc),

          //

          YesterdayPollSimple(
            mood: mood,
          ),

          //
        ],
      ),
    );
  }
}

class PollExtendedWidget extends StatelessWidget {
  //

  final UserPollBloc bloc;
  PollExtendedWidget({@required this.bloc});

  //
  @override
  Widget build(BuildContext context) {
    //

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(16.0),
      height: BASE_POLL_HEIGHT,
      decoration: BoxDecoration(
          color: AppColors.userPollBackground,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          _UserPollTopPart(bloc: bloc),

          //
        ],
      ),
    );
  }
}

class _UserPollTopPart extends StatelessWidget {
  final UserPollBloc bloc;
  _UserPollTopPart({@required this.bloc});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // Simple
              GestureDetector(
                onTap: () {
                  if (bloc.isSimple == false)
                    bloc.add(PollSimple(poll: bloc.currentPoll));
                },
                child: Container(
                  width: 96.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        lang.simple.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: (bloc.isSimple)
                              ? AppColors.textPrimary
                              : AppColors.textDisabled,
                        ),
                      ),
                      Container(
                        width: 64,
                        child: Divider(
                          height: 16.0,
                          thickness: 2,
                          color: (bloc.isSimple)
                              ? AppColors.accentDark
                              : AppColors.textDisabled,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Complex
              GestureDetector(
                onTap: () {
                  if (bloc.isSimple == true)
                    bloc.add(PollComplex(poll: bloc.currentPoll));
                },
                child: Container(
                  width: 128.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        lang.extended.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: (bloc.isSimple)
                              ? AppColors.textDisabled
                              : AppColors.textPrimary,
                        ),
                      ),
                      Container(
                        width: 96,
                        child: Divider(
                          height: 16.0,
                          thickness: 2,
                          color: (bloc.isSimple)
                              ? AppColors.textDisabled
                              : AppColors.accentDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Settings
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PollSettings(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
