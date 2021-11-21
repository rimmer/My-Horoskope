import 'package:base/int_datetime.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:base/user/entity/user.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:text/text.dart';

class BirthRowInfo {
  String astroSign;
  DateTime birthDate;
}

class _UserDetailsForDailyScreenLogic extends ChangeNotifier {
  _UserDetailsForDailyScreenLogic({@required this.user})
      : label = "${user.model.name.capitalize()} (${localeText.you.capitalize()})",
        astroSign = user.model.birth.astroSign,
        birthDate = user.model.birth.toDateTime;

  final UserEntity user;
  final String label;
  final String astroSign;
  final DateTime birthDate;
}

class UserDetailsForDailyScreenLogic extends InheritedWidget {
  UserDetailsForDailyScreenLogic({
    @required UserEntity user,
    @required Widget child,
  })  : _bound = _UserDetailsForDailyScreenLogic(user: user),
        super(child: child);

  final _UserDetailsForDailyScreenLogic _bound;

  static _UserDetailsForDailyScreenLogic of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<UserDetailsForDailyScreenLogic>())._bound;

  @override
  bool updateShouldNotify(UserDetailsForDailyScreenLogic old) => false;
}
