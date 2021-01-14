import 'package:my_prophet/components/gradient_flatbutton.dart';
import 'package:flutter/material.dart';

import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:language/language.dart';
import 'package:user_poll/bloc.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:my_prophet/components/poll_settings.dart';
import 'package:my_prophet/components/yesterday_poll.dart';
import 'package:poll_model/poll_model.dart';
import 'package:user_poll/bloc/user_poll_bloc.dart';

const double BASE_POLL_HEIGHT = 256.0;
const double EXTENDED_POLL_HEIGHT = 548.0;

class PollSimpleWidget extends StatelessWidget {
  //
  final UserPollBloc bloc;
  PollSimpleWidget({@required this.bloc});

  //
  @override
  Widget build(BuildContext context) {
    //
    /// mutable wrappers
    final yestFeelings = bloc.repo.todayPoll;

    final MutableInteger mood = MutableInteger(yestFeelings.mood.value);

    //

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(16.0),
      height: BASE_POLL_HEIGHT,
      decoration: BoxDecoration(
          color: AppColors.userPollBackground,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _UserPollTopPart(bloc: bloc),

          //

          yesterdayPollSimple(
            userPollBloc: bloc,
            mood: mood,
          ),

          //

          Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: gradientFlatButton(
              onPressed: () {
                bloc.current.voted = true;
                bloc.repo.save(bloc.user.id);
                bloc.add(UserPollRestartEvent());
              },
              child: Text(
                lang.clarifyForecast.toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              padding: EdgeInsets.only(
                top: 11,
                bottom: 11,
                left: 34,
                right: 34,
              ),
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.accentDark,
                  AppColors.accent,
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentDark,
                  offset: Offset(1.0, 2.0),
                  blurRadius: 10,
                )
              ],
            ),
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
    /// mutable wrappers
    final yestFeelings = bloc.repo.todayPoll;

    final MutableInteger mood = MutableInteger(yestFeelings.mood.value);
    final MutableInteger productivity =
        MutableInteger(yestFeelings.poll(PollModelType.PRODUCTIVITY).value);
    final MutableInteger relationship =
        MutableInteger(yestFeelings.poll(PollModelType.RELATIONSHIPS).value);
    final MutableInteger selfdevelopment =
        MutableInteger(yestFeelings.poll(PollModelType.SELFDEVELOPMENT).value);
    final MutableInteger activity = MutableInteger(
        yestFeelings.poll(PollModelType.PHYSICAL_ACTIVITY).value);

    //

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(16.0),
      height: EXTENDED_POLL_HEIGHT,
      decoration: BoxDecoration(
          color: AppColors.userPollBackground,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          _UserPollTopPart(bloc: bloc),

          //

          yesterdayPollExtended(
            userPollBloc: bloc,
            mood: mood,
            productivity: productivity,
            relationship: relationship,
            selfdevelopment: selfdevelopment,
            activity: activity,
          ),

          //

          Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: gradientFlatButton(
              onPressed: () {
                bloc.current.voted = true;
                bloc.repo.save(bloc.user.id);
                bloc.add(UserPollRestartEvent());
              },
              child: Text(
                lang.clarifyForecast.toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              padding: EdgeInsets.only(
                top: 11,
                bottom: 11,
                left: 34,
                right: 34,
              ),
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.accentDark,
                  AppColors.accent,
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentDark,
                  offset: Offset(1.0, 2.0),
                  blurRadius: 10,
                )
              ],
            ),
          ),

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
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // Simple
              GestureDetector(
                onTap: () {
                  if (bloc.user.pollsAreComplex == true)
                    bloc.add(UserPollSwitchSimpleEvent());
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
                          color: (bloc.user.pollsAreComplex)
                              ? AppColors.textDisabled
                              : AppColors.textPrimary,
                        ),
                      ),
                      Container(
                        width: 64,
                        child: Divider(
                          height: 16.0,
                          thickness: 2,
                          color: (bloc.user.pollsAreComplex)
                              ? AppColors.textDisabled
                              : AppColors.accentDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Complex
              GestureDetector(
                onTap: () {
                  if (bloc.user.pollsAreComplex == false)
                    bloc.add(UserPollSwitchComplexEvent());
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
                          color: (bloc.user.pollsAreComplex)
                              ? AppColors.textPrimary
                              : AppColors.textDisabled,
                        ),
                      ),
                      Container(
                        width: 108,
                        child: Divider(
                          height: 16.0,
                          thickness: 2,
                          color: (bloc.user.pollsAreComplex)
                              ? AppColors.accentDark
                              : AppColors.textDisabled,
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
