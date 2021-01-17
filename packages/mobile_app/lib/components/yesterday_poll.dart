import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';

import 'package:user_poll/bloc.dart';
import 'package:language/language.dart';
import 'package:poll_model/poll_model.dart';
import 'magic_poll.dart';

Padding yesterdayPollSimple(
        {@required MutableInteger mood, @required UserPollBloc userPollBloc})
    //
    =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${lang.rateYourYesterday.capitalize()}...",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),

          /// MOOD poll
          Text(
            lang.mood.capitalize(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          MagicPollPicker(
            onTap: () {
              userPollBloc.current.pollSetAll(mood.wrapped);
              userPollBloc.repo.save(userPollBloc.user.id);
            },
            value: mood,
          ),
        ],
      ),
    );

Padding yesterdayPollExtended({
  @required MutableInteger mood,
  @required MutableInteger productivity,
  @required MutableInteger relationship,
  @required MutableInteger selfdevelopment,
  @required MutableInteger activity,
  @required UserPollBloc userPollBloc,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${lang.rateYourYesterday.capitalize()}...",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),

          /// MOOD poll
          Text(
            lang.mood.capitalize(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          MagicPollPicker(
            onTap: () {
              userPollBloc.current.pollSet(PollModelType.MOOD, mood.wrapped);
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
              userPollBloc.current
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
              userPollBloc.current
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
              userPollBloc.current.pollSet(
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
              userPollBloc.current
                  .pollSet(PollModelType.PHYSICAL_ACTIVITY, activity.wrapped);
              userPollBloc.repo.save(userPollBloc.user.id);
            },
            value: activity,
          ),
        ],
      ),
    );
