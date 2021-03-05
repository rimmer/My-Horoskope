import 'package:flutter/material.dart';
import 'package:user_model/user_model.dart';
import 'package:my_prophet/single_provider.dart';

/// solves https://github.com/rimmer/my_prophet/issues/30

void userInformationChangeMisc(
    {@required SingleProvider sp,
    @required UserModel model,
    @required BuildContext context}) async {
  //

  sp.usersRepo.current.model = model;
  await sp.usersRepo.write();
  sp.userPollBloc.add(UserPollRestartEvent());

  Navigator.of(context)
      .pushNamedAndRemoveUntil('/daily', (Route<dynamic> route) => false);
}

void userInformationChangeMajor(
    {@required SingleProvider sp,
    @required UserModel model,
    @required BuildContext context}) async {
  //

  /// Yup, looks silly, but it works.
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

  sp.authBloc.add(AuthEvent(model));
}
