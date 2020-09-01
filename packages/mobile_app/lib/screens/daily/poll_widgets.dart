import 'package:app/components/gradient_flatbutton.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:provider/provider.dart';
import 'package:language/language.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/theme/app_colors.dart';
import 'package:algorithm/algorithm.dart';
import 'package:app/components/poll_settings.dart';
import 'package:app/components/yesterday_poll.dart';
import 'package:poll_model/poll_model.dart';

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
    final yestFeelings = bloc.pollsRepo.todayPoll;

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

          YesterdayPollSimple(
            mood: mood,
          ),

          //

          Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: GradientFlatButton(
              onPressed: () {},
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
    final yestFeelings = bloc.pollsRepo.todayPoll;

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

          YesterdayPollExtended(
            mood: mood,
            productivity: productivity,
            relationship: relationship,
            selfdevelopment: selfdevelopment,
            activity: activity,
          ),

          //

          Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: GradientFlatButton(
              onPressed: () {},
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
