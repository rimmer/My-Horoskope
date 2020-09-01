import 'package:app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language/language.dart';
import 'magic_poll.dart';
import 'package:user_poll/bloc.dart';
import 'package:algorithm/interface.dart';
import 'package:userpoll/userpoll.dart';

class YesterdayPollSimple extends StatelessWidget {
  final MutableInteger mood;
  final UserPollBloc pollsState;
  YesterdayPollSimple({@required this.mood, @required this.pollsState});

  @override
  Widget build(BuildContext context) {
    //

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
            value: mood,
            onTap: () {
              pollsState.add(
                PollUsed(
                    poll: UserPoll(
                        dt: pollsState.currentPoll.dt,
                        //
                        mood: mood.wrapped),
                    enabled: pollsState.enabled),
              );
            },
          ),
        ],
      ),
    );
  }
}

class YesterdayPollExtended extends StatelessWidget {
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
          MagicPollPicker(value: mood),
          SizedBox(height: 16),

          /// PRODUCTIVITY poll
          Text(
            lang.productivity.capitalize(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          MagicPollPicker(value: productivity),
          SizedBox(height: 16),

          /// RELATIONSHIP poll
          Text(
            lang.relationships.capitalize(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          MagicPollPicker(value: relationship),
          SizedBox(height: 16),

          /// SELF_DEVELOPMENT poll
          Text(
            lang.selfdevelopment.capitalize(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          MagicPollPicker(value: selfdevelopment),
          SizedBox(height: 16),

          /// PHYSICAL_ACTIVITY poll
          Text(
            lang.physicalActivity.capitalize(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          MagicPollPicker(value: activity),
        ],
      ),
    );
  }
}
