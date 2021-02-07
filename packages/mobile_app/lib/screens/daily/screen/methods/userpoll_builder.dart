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
        return SizedBox();

      case UserPollIsSimpleState:
        print("User poll is switched to simple state");
        return PollSimpleWidget(bloc: sp.userPollBloc);

      case UserPollIsComplexState:
        print("User poll is switched to complex state");
        return PollExtendedWidget(bloc: sp.userPollBloc);
    }
  }
}
