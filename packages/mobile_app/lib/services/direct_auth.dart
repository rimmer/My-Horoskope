import 'package:flutter/material.dart';
import 'package:base/user/entity/user.dart';
import 'static_provider.dart';

/// solves https://github.com/rimmer/my_prophet/issues/30

void userInformationChangeMisc(
    {@required UserModel model, @required BuildContext context}) async {
  //

  StaticProvider.data.usersRepo.current.model = model;
  await StaticProvider.data.usersRepo.write();

  Navigator.of(context)
      .pushNamedAndRemoveUntil('/daily', (Route<dynamic> route) => false);
}

void userInformationChangeMajor(
    {@required UserModel model, @required BuildContext context}) async {
  //

  /// Yup, looks silly, but it works.
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

  StaticProvider.authBloc.add(AuthEvent(model));
}
