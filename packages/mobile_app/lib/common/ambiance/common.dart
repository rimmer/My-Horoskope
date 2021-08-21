import 'package:flutter/material.dart';
import 'package:text/text.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:my_horoskope/common//userinfo_field.dart';
import 'package:my_horoskope/common//userinfo_picker.dart';

export 'package:flutter/material.dart';
export 'package:text/text.dart';
export 'package:my_horoskope/theme/app_colors.dart';
export 'package:my_horoskope/theme/app_text_style.dart';
export 'package:mutable_wrappers/mutable_wrappers.dart';
export 'package:my_horoskope/app_global.dart';
export 'package:my_horoskope/common/gradient_flatbutton.dart';
export 'package:my_horoskope/common//gradient_border_button.dart';
export 'package:base/int_datetime.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:my_horoskope/common//triangle_painter.dart';

class AmbianceUserInputFields extends StatelessWidget {
  final MutableString name;
  final MutableString role;
  final MutableString month;
  final MutableString day;
  final MutableString year;
  final MutableInteger sex;

  AmbianceUserInputFields({
    Key key,
    @required this.name,
    @required this.role,
    @required this.day,
    @required this.month,
    @required this.year,
    @required this.sex,
  }) : super(key: key);

  final indexToSex = {
    0: localeText.notSelectedSex.capitalize(),
    1: localeText.male.capitalize(),
    2: localeText.female.capitalize(),
    3: localeText.other.capitalize(),
  };

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // name
        UserInfoField(
          textObject: name,
          maxLength: 100,
          keyboardType: TextInputType.name,
          capitalizationType: TextCapitalization.words,
          hint: localeText.name.capitalize(),
          onEditingComplete: () => node.nextFocus(),
          validator: (String text) {
            int min = 2;
            if (text.isEmpty || text.length < min) return "${localeText.atLeastXsymbolsNeeded} $min";
            return null;
          },
        ),
        // role
        UserInfoField(
          textObject: role,
          maxLength: 100,
          keyboardType: TextInputType.name,
          capitalizationType: TextCapitalization.words,
          hint: localeText.role.capitalize(),
          onEditingComplete: () => node.nextFocus(),
          validator: (String text) {
            int min = 1;
            if (text.isEmpty || text.length < min) return "${localeText.atLeastXsymbolsNeeded} $min";
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 4.0),
          child: Text(
            localeText.birthdate.capitalize(),
            style: AppTextStyle.fadeText,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: UserInfoField(
                  textObject: day,
                  maxLength: 2,
                  keyboardType: TextInputType.datetime,
                  hint: "dd",
                  onEditingComplete: () => node.nextFocus(),
                  validator: (String text) {
                    int min = 1;
                    if (text.isEmpty || text.length < min) return "${text.length}/$min";
                    if (int.parse(text) > 31 || int.parse(text) < 1) return "x";
                    if (text.length == 1 && int.parse(text) > 3) node.nextFocus();
                    if (text.length == 2) node.nextFocus();
                    return null;
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: UserInfoField(
                  textObject: month,
                  maxLength: 2,
                  keyboardType: TextInputType.datetime,
                  hint: "mm",
                  onEditingComplete: () => node.nextFocus(),
                  validator: (String text) {
                    int min = 1;
                    if (text.isEmpty || text.length < min) return "${text.length}/$min";
                    if (int.parse(text) > 12 || int.parse(text) < 1) return "x";
                    if (text.length == 1 && int.parse(text) > 1) node.nextFocus();
                    if (text.length == 2) node.nextFocus();
                    return null;
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: UserInfoField(
                  textObject: year,
                  maxLength: 4,
                  keyboardType: TextInputType.datetime,
                  hint: "yyyy",
                  onEditingComplete: () => node.unfocus(),
                  validator: (String text) {
                    int min = 4;
                    if (text.isEmpty || text.length < min) return "${text.length}/$min";
                    if (text.length == 4) node.unfocus();
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 4.0),
          child: Text(
            localeText.sex.capitalize(),
            style: AppTextStyle.fadeText,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 4.0,
                  ),
                  child: UserInfoPicker(
                    items: indexToSex,
                    indexObject: sex,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
