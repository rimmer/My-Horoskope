import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';

import 'package:my_prophet/theme/app_colors.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'package:user_poll/bloc.dart';
import 'package:language/language.dart';
import 'package:poll_model/poll_model.dart';
import 'magic_poll.dart';

const _HEIGHT_OF_COMPLEXITY_TAB = 34.0;
const _WIDTH_OF_COMPLEXITY_TAB = 146.0;

Column yesterdayPollSimple(
        {@required MutableInteger mood, @required UserPollBloc userPollBloc})
    //
    =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// MOOD poll
        Text(
          lang.mood.capitalize(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        MagicPollPicker(
          onTap: () {
            userPollBloc.repo.todayPoll.pollSetAll(mood.wrapped);
            userPollBloc.repo.save(userPollBloc.user.id);
          },
          value: mood,
        ),
      ],
    );

Column yesterdayPollExtended({
  @required MutableInteger mood,
  @required MutableInteger productivity,
  @required MutableInteger relationship,
  @required MutableInteger selfdevelopment,
  @required MutableInteger activity,
  @required UserPollBloc userPollBloc,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// MOOD poll
        Text(
          lang.mood.capitalize(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        MagicPollPicker(
          onTap: () {
            userPollBloc.repo.todayPoll
                .pollSet(PollModelType.MOOD, mood.wrapped);
            userPollBloc.repo.save(userPollBloc.user.id);
          },
          value: mood,
        ),
        SizedBox(height: 16),

        /// PRODUCTIVITY poll
        Text(
          lang.productivity.capitalize(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        MagicPollPicker(
          onTap: () {
            userPollBloc.repo.todayPoll
                .pollSet(PollModelType.PRODUCTIVITY, productivity.wrapped);
            userPollBloc.repo.save(userPollBloc.user.id);
          },
          value: productivity,
        ),
        SizedBox(height: 16),

        /// RELATIONSHIP poll
        Text(
          lang.relationships.capitalize(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        MagicPollPicker(
          onTap: () {
            userPollBloc.repo.todayPoll
                .pollSet(PollModelType.RELATIONSHIPS, relationship.wrapped);
            userPollBloc.repo.save(userPollBloc.user.id);
          },
          value: relationship,
        ),
        SizedBox(height: 16),

        /// SELF_DEVELOPMENT poll
        Text(
          lang.selfdevelopment.capitalize(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        MagicPollPicker(
          onTap: () {
            userPollBloc.repo.todayPoll.pollSet(
                PollModelType.SELFDEVELOPMENT, selfdevelopment.wrapped);
            userPollBloc.repo.save(userPollBloc.user.id);
          },
          value: selfdevelopment,
        ),
        SizedBox(height: 16),

        /// PHYSICAL_ACTIVITY poll
        Text(
          lang.physicalActivity.capitalize(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        MagicPollPicker(
          onTap: () {
            userPollBloc.repo.todayPoll
                .pollSet(PollModelType.PHYSICAL_ACTIVITY, activity.wrapped);
            userPollBloc.repo.save(userPollBloc.user.id);
          },
          value: activity,
        ),
      ],
    );

Container userPollTabs({@required UserPollBloc bloc}) => Container(
      child: Row(
        children: <Widget>[
          // Simple
          FlatButton(
            onPressed: () {
              if (bloc.user.pollsAreComplex == true)
                bloc.add(UserPollSwitchSimpleEvent());
            },
            child: Container(
              decoration: BoxDecoration(
                color: (bloc.user.pollsAreComplex)
                    ? AppColors.userPollTabInactive
                    : AppColors.userPollTabActive,
              ),
              height: _HEIGHT_OF_COMPLEXITY_TAB,
              width: _WIDTH_OF_COMPLEXITY_TAB,
              child: Center(
                child: Text(
                  lang.simple.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
          // Complex
          FlatButton(
            onPressed: () {
              if (bloc.user.pollsAreComplex == false)
                bloc.add(UserPollSwitchComplexEvent());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: (bloc.user.pollsAreComplex)
                      ? AppColors.userPollTabActive
                      : AppColors.userPollTabInactive),
              height: _HEIGHT_OF_COMPLEXITY_TAB,
              width: _WIDTH_OF_COMPLEXITY_TAB,
              child: Center(
                child: Text(
                  lang.extended.toUpperCase(),
                  style: AppTextStyle.normalText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
