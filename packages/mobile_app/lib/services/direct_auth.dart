import 'package:app/components/user_settings/index.dart';

/// solves https://github.com/rimmer/my_prophet/issues/30

import 'package:app/single_provider.dart';

void userInformationChangeMisc(
    {@required SingleProvider sp,
    @required UserModel model,
    @required BuildContext context}) async {
  //

  sp.usersRepo.current.model = model;
  await sp.usersRepo.write();

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
