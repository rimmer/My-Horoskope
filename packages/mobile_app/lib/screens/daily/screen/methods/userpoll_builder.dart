part of '../screen.dart';

extension DailyScreenUserPollBuilder on _DailyScreenState {
  Widget userPollBuilder(BuildContext context, UserPollState state) {
    switch (state.runtimeType) {

      /// I am adding debug prints, jsut in case

      case UserPollLoadingState:
        print("User polls are loading.");
        return SpinKitPulse(
          color: AppColors.accentDark,
          size: 32,
        );

      case UserPollIsDisabled:
        print("User polls are disabled for current user");
        return PollSettings();

      case UserPollIsVotedState:
        print("User poll is voted");
        sp.prophecyBloc.add(CalculateProphecy(dtDay));

        return AccentBlackboard(
          title: Padding(
            padding: const EdgeInsets.only(
              left: 3.0,
            ),
            child: TitleWithDescription(
              title: lang.todayAdvice.capitalize(),
              notation: lang.todayAdviceNotation,
              height: 210.0,
              width: 250.0,
            ),
          ),
          textStream: dat.prediction.stream,
          margin: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          padding: EdgeInsets.all(16.0),
        );

      case UserPollIsSimpleState:
        print("User poll is switched to simple state");
        return pollSimpleWidget(bloc: sp.userPollBloc);

      case UserPollIsComplexState:
        print("User poll is switched to complex state");
        return pollExtendedWidget(bloc: sp.userPollBloc);
    }
  }
}
