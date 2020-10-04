import 'package:app/components/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:authentication/bloc.dart';
import 'package:app/components/userinfo_field.dart';
import 'package:app/components/userinfo.dart';
import 'package:app/components/gradient_flatbutton.dart';
import 'package:app/components/userinfo_picker.dart';
import 'package:user_model/user_model.dart';
import 'accept_terms.dart';

class RegistrationScreen extends StatelessWidget {
  final name = MutableString("");
  final month = MutableString("");
  final day = MutableString("");
  final year = MutableString("");
  final sex = MutableInteger(0);
  final indexToSex = {
    0: lang.notSelectedSex.capitalize(),
    1: lang.male.capitalize(),
    2: lang.female.capitalize(),
    3: lang.other.capitalize(),
  };
  final country = MutableString("");
  final place = MutableString("");
  final termsAccepted = MutableBool(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 64,
            top: 4,
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset(
                'assets/launcher/icon.png',
                height: 96,
                width: 96,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Daily ",
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "AI ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Horoscope",
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "offline",
                style: TextStyle(color: AppColors.textDisabled),
              ),
            ),
            userInfo(
              name: UserInfoField(
                  textObject: name,
                  maxLength: 100,
                  hint: lang.name.capitalize(),
                  validator: (String text) {
                    int min = 2;
                    if (text.isEmpty || text.length < min)
                      return "${lang.atLeastXsymbolsNeeded} $min";
                    return null;
                  }),
              month: UserInfoField(
                  textObject: month,
                  maxLength: 2,
                  keyboardType: TextInputType.datetime,
                  hint: "mm",
                  validator: (String text) {
                    int min = 2;
                    if (text.isEmpty || text.length < min)
                      return "${text.length}/$min";
                    if (int.parse(text) > 12 || int.parse(text) < 1) return "x";
                    return null;
                  }),
              day: UserInfoField(
                  textObject: day,
                  maxLength: 2,
                  keyboardType: TextInputType.datetime,
                  hint: "dd",
                  validator: (String text) {
                    int min = 2;
                    if (text.isEmpty || text.length < min)
                      return "${text.length}/$min";
                    if (int.parse(text) > 31 || int.parse(text) < 1) return "x";
                    return null;
                  }),
              year: UserInfoField(
                  textObject: year,
                  maxLength: 4,
                  keyboardType: TextInputType.datetime,
                  hint: "yyyy",
                  validator: (String text) {
                    int min = 4;
                    if (text.isEmpty || text.length < min)
                      return "${text.length}/$min";
                    return null;
                  }),
              sex: UserInfoPicker(
                items: indexToSex,
                indexObject: sex,
              ),
              country: UserInfoField(
                  textObject: country,
                  maxLength: 50,
                  hint: lang.birthcountry.capitalize(),
                  validator: (String text) {
                    return null;
                  }),
              place: UserInfoField(
                  textObject: place,
                  maxLength: 100,
                  hint: lang.birthplace.capitalize(),
                  validator: (String text) {
                    return null;
                  }),
            ),
            AcceptTermsRow(terms: termsAccepted),
            SizedBox(
              height: 32,
            ),
            gradientFlatButton(
              onPressed: () {
                // @DEBUG
                // print("Name ${name.wrapped}");
                // print("Month: ${month.wrapped}");
                // print("Day: ${day.wrapped}");
                // print("Year: ${year.wrapped}");
                // print("Sex: ${indexToSex[sex.wrapped]}");
                // print("Country: ${country.wrapped}");
                // print("Place: ${place.wrapped}");

                if (name.wrapped.isEmpty ||
                    month.wrapped.isEmpty ||
                    day.wrapped.isEmpty ||
                    year.wrapped.isEmpty) {
                  showOverCurrentScreen(
                      context: context,
                      child: _wrongInformation(lang.notAllFieldsFilled));
                  return;
                }
                if (termsAccepted.wrapped == false) {
                  showOverCurrentScreen(
                      context: context,
                      child: _wrongInformation(lang.termsAreNotAccepted));
                  return;
                }

                final AuthenticationBloc auth =
                    context.bloc<AuthenticationBloc>();

                auth.add(AuthEvent(UserModel(
                  name: name.wrapped,
                  birth: DateTime.utc(
                    int.parse(year.wrapped),
                    int.parse(month.wrapped),
                    int.parse(day.wrapped),
                  ).millisecondsSinceEpoch,
                  sex: sex.wrapped,
                  country: country.wrapped,
                  place: place.wrapped,
                )));
              },
              child: Text(
                lang.start.toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              padding: EdgeInsets.symmetric(
                /// padding for a gradient button
                /// in registration screen
                vertical: 16.0,
                horizontal: 109.0,
              ),
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.accentDark,
                  AppColors.accent,
                ],
              ),
              borderRadius: BorderRadius.circular(32.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentDark,
                  offset: Offset(-1.0, 2.0),
                  blurRadius: 16,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class _wrongInformation extends StatelessWidget {
  final String title;
  _wrongInformation(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Text(
        title,
        style: TextStyle(color: AppColors.textPrimary),
      ),
    );
  }
}
