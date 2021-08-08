import 'package:flutter/material.dart';
import 'package:base/user/entity/user.dart';
import 'package:base/cards.dart';
import 'package:my_prophet/app_global.dart';
import 'package:my_prophet/routes.dart';

/// solves https://github.com/rimmer/my_prophet/issues/30

void userInformationChangeMisc(
    {@required UserModel model, @required BuildContext context}) async {
  //

  AppGlobal.data.usersRepo.current.model = model;
  await AppGlobal.data.usersRepo.write();

  Navigator.of(context).pushReplacementNamed(AppPath.daily);
}

void userInformationChangeMajor(
    {@required UserModel model, @required BuildContext context}) async {
  //
  Cards().restart();

  Navigator.of(context).pushReplacementNamed(AppPath.auth);

  AppGlobal.authBloc.add(AuthEvent(model));
}
