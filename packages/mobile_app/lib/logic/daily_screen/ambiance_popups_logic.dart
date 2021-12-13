import 'package:base/user/entity/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class _AmbiancePopupsLogic extends ChangeNotifier {
  bool ambianceAdd = false;
  bool ambianceChange = false;
  UserEntity _subjectToChange;

  UserEntity get subjectToChange => _subjectToChange;
  void setSubjectToChange(UserEntity newSubject) {
    _subjectToChange = newSubject;
  }

  void unfocusAmbiancePopup() {
    ambianceAdd = false;
    ambianceChange = false;
    notifyListeners();
  }

  void focusAmbianceAdd() {
    ambianceAdd = true;
    notifyListeners();
  }

  void focusAmbianceChange() {
    ambianceChange = true;
    notifyListeners();
  }
}

class AmbiancePopupsLogic extends InheritedWidget {
  AmbiancePopupsLogic({
    @required Widget child,
  })  : _bound = _AmbiancePopupsLogic(),
        super(child: child);

  final _AmbiancePopupsLogic _bound;

  static _AmbiancePopupsLogic of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<AmbiancePopupsLogic>())._bound;

  @override
  bool updateShouldNotify(AmbiancePopupsLogic old) => false;
}
