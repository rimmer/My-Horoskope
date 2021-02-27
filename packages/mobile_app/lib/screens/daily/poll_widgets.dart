import 'package:my_prophet/components/gradient_flatbutton.dart';
import 'package:flutter/material.dart';

import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:language/language.dart';
import 'package:my_prophet/components/title_description.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'package:user_poll/bloc.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:my_prophet/components/yesterday_poll.dart';
import 'package:poll_model/poll_model.dart';
import 'package:user_poll/bloc/user_poll_bloc.dart';

Container pollSimpleWidget({@required UserPollBloc bloc}) {
  final yestFeelings = bloc.repo.todayPoll;

  final MutableInteger mood = MutableInteger(yestFeelings.mood.value);

  return Container(
    padding: _sheetPadding(),
    margin: _sheetMargin(),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.prophecyGradientStart.withOpacity(0.9),
            AppColors.prophecyGradientEnd.withOpacity(0.9),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(8.0)),
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        _topPart(bloc),
        //
        yesterdayPollSimple(
          userPollBloc: bloc,
          mood: mood,
        ),

        _voteButton(bloc),
      ],
    ),
  );
}

Container pollExtendedWidget({@required UserPollBloc bloc}) {
  final yestFeelings = bloc.repo.todayPoll;

  final MutableInteger mood = MutableInteger(yestFeelings.mood.value);
  final MutableInteger productivity =
      MutableInteger(yestFeelings.poll(PollModelType.PRODUCTIVITY).value);
  final MutableInteger relationship =
      MutableInteger(yestFeelings.poll(PollModelType.RELATIONSHIPS).value);
  final MutableInteger selfdevelopment =
      MutableInteger(yestFeelings.poll(PollModelType.SELFDEVELOPMENT).value);
  final MutableInteger activity =
      MutableInteger(yestFeelings.poll(PollModelType.PHYSICAL_ACTIVITY).value);

  return Container(
    padding: _sheetPadding(),
    margin: _sheetMargin(),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.prophecyGradientStart.withOpacity(0.9),
            AppColors.prophecyGradientEnd.withOpacity(0.9),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(8.0)),
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        _topPart(bloc),
        //
        yesterdayPollExtended(
          userPollBloc: bloc,
          mood: mood,
          productivity: productivity,
          relationship: relationship,
          selfdevelopment: selfdevelopment,
          activity: activity,
        ),
        _voteButton(bloc),
      ],
    ),
  );
}

ListView _topPart(UserPollBloc bloc) => ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          TitleWithDescription(
            title: lang.todayAdvice.capitalize(),
            notation: lang.todayAdviceHint,
            height: 210.0,
            width: 250.0,
          ),
          SizedBox(height: 18.0),
          Text(
            "${lang.howTodayAdvice.capitalize()}...",
            style: AppTextStyle.normalText,
          ),
          userPollTabs(bloc: bloc),
        ]);

Container _voteButton(UserPollBloc bloc) => Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: gradientFlatButton(
        onPressed: () {
          bloc.add(UserPollVoteEvent());
        },
        child: Text(
          lang.clarifyForecast.toUpperCase(),
          style: AppTextStyle.normalText,
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
    );

EdgeInsets _sheetMargin() => EdgeInsets.only(
      left: 16.0,
      right: 16.0,
      bottom: 16.0,
    );

EdgeInsets _sheetPadding() => EdgeInsets.only(
      left: 16.0,
      right: 16.0,
      top: 16.0,
    );
