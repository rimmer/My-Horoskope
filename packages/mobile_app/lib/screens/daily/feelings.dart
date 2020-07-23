import 'package:algorithm/algorithm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language/language.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/components/poll_settings.dart';

class Feelings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sessionAlgorithm = context.watch<Algorithm>();
    UserPollBloc userPollBloc = context.bloc<UserPollBloc>();

    return (sessionAlgorithm.pollAvailability.value == true)
        ? BlocBuilder<UserPollBloc, UserPollState>(
            bloc: userPollBloc,
            builder: (context, state) {
              if (state is UserPollChanged) {
                return (userPollBloc.isSimple)
                    ? _PollSimple(bloc: userPollBloc)
                    : _PollExtended(bloc: userPollBloc);
              }
              return _PollSimple(bloc: userPollBloc);
            },
          )
        : PollSettings(
            algorithm: sessionAlgorithm,
          );
  }
}

class _PollSimple extends StatelessWidget {
  final UserPollBloc bloc;
  _PollSimple({@required this.bloc});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(16.0),
      height: 192.0,
      decoration: BoxDecoration(
          color: AppColors.userPollBackground,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[_userPollTopPart(bloc: bloc)],
      ),
    );
  }
}

class _PollExtended extends StatelessWidget {
  final UserPollBloc bloc;
  _PollExtended({@required this.bloc});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(16.0),
      height: 192.0,
      decoration: BoxDecoration(
          color: AppColors.userPollBackground,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[_userPollTopPart(bloc: bloc)],
      ),
    );
  }
}

class _userPollTopPart extends StatelessWidget {
  final UserPollBloc bloc;
  _userPollTopPart({@required this.bloc});
  @override
  Widget build(BuildContext context) {
    final sessionAlgorithm = context.watch<Algorithm>();

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
                    PollSettings(
                      algorithm: sessionAlgorithm,
                    ),
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
