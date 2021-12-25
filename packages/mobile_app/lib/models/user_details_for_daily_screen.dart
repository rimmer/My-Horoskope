import 'package:base/int_datetime.dart';
import 'package:base/preferences/setting/enabled_prophecies/item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:base/user/entity/user.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:text/text.dart';

class BirthRowInfo {
  const BirthRowInfo({
    @required this.astroSign,
    @required this.birthDate,
  });
  final String astroSign;
  final DateTime birthDate;
}

class _UserDetailsForDailyScreen {
  _UserDetailsForDailyScreen({
    @required this.user,
    @required this.propheciesToShow,
  })  : label = "${user.model.name.capitalize()} (${localeText.you.capitalize()})",
        astroSign = user.model.birth.astroSign,
        birthDate = user.model.birth.toDateTime;

  final UserEntity user;
  final String label;
  final String astroSign;
  final DateTime birthDate;
  final EnabledProphecies propheciesToShow;
}

class UserDetailsForDailyScreen extends InheritedWidget {
  UserDetailsForDailyScreen({
    @required UserEntity user,
    @required EnabledProphecies propheciesToShow,
    @required Widget child,
  })  : _bound = _UserDetailsForDailyScreen(
          user: user,
          propheciesToShow: propheciesToShow,
        ),
        super(child: child);

  final _UserDetailsForDailyScreen _bound;

  static _UserDetailsForDailyScreen of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<UserDetailsForDailyScreen>())._bound;

  @override
  bool updateShouldNotify(UserDetailsForDailyScreen old) => true;
}
