import 'package:flutter/material.dart';
import 'package:int_datetime/int_datetime.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';

import 'package:user_poll/bloc.dart';
import 'package:language/language.dart';
import 'package:poll_model/poll_model.dart';
import 'package:userpoll/userpoll.dart';
import 'magic_poll.dart';

class YesterdayPollSimple extends StatelessWidget {
  final UserPollBloc userPollBloc;
  final MutableInteger mood;
  YesterdayPollSimple({@required this.mood, @required this.userPollBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              userPollBloc.repo.todayPoll.pollSetAll(mood.wrapped);
              userPollBloc.repo.save(userPollBloc.user.id);
            },
            value: mood,
          ),
        ],
      ),
    );
  }
}

class YesterdayPollExtended extends StatelessWidget {
  final UserPollBloc userPollBloc;
  final MutableInteger mood;
  final MutableInteger productivity;
  final MutableInteger relationship;
  final MutableInteger selfdevelopment;
  final MutableInteger activity;

  YesterdayPollExtended({
    @required this.mood,
    @required this.productivity,
    @required this.relationship,
    @required this.selfdevelopment,
    @required this.activity,
    @required this.userPollBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      ),
    );
  }
}
