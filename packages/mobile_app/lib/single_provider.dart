import 'package:polls_repository/polls_repository.dart';
import 'package:prophecy/bloc.dart';
import 'package:authentication/bloc.dart';
import 'package:user_poll/bloc.dart';
import 'package:users_repository/users_repository.dart';
import 'package:prophecy_to_show_storage/prophecy_to_show_storage.dart';
import 'package:my_prophet/services/predictions.dart';
import 'package:app_preferences_flutter/app_preferences_flutter.dart';

export 'package:prophecy/bloc.dart';
export 'package:authentication/bloc.dart';
export 'package:user_poll/bloc.dart';
export 'package:algorithm/algorithm.dart';
export 'package:prophecy_to_show_storage/prophecy_to_show_storage.dart';
export 'package:polls_repository/polls_repository.dart';
export 'package:my_prophet/services/predictions.dart';
export 'package:app_preferences_flutter/app_preferences_flutter.dart';

/// our widget tree and code is a little messy because of providers
/// I save all needed data in one object that will be inherited
class SingleProvider {
  AuthenticationBloc authBloc;
  UsersRepository usersRepo;
  PollsRepository pollsRepo;
  UserPollBloc userPollBloc;
  ProphecyBloc prophecyBloc;
  ProphecyToShowStorage show;
  DefaultPredictions predictions;
  AppPreferences appPreferences;
}
