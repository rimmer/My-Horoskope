import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/components/userinfo_field.dart';
import 'package:app/components/userinfo.dart';
import 'package:app/components/gradient_flatbutton.dart';
import 'package:app/models/mutable_text.dart';
import 'package:app/models/mutable_int.dart';

class RegistrationScreen extends StatelessWidget {
  final name = MutableText("");
  final month = MutableText("");
  final day = MutableText("");
  final year = MutableText("");
  final sex = MutableText("");
  final country = MutableText("");
  final place = MutableText("");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
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
              UserInfo(
                name: UserInfoField(
                    textObject: name,
                    maxLength: 100,
                    hint: lang.name,
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
                sex: UserInfoField(
                    textObject: sex,
                    maxLength: 50,
                    hint: lang.notSelectedSex,
                    validator: (String text) {
                      int min = 2;
                      if (text.isEmpty || text.length < min)
                        return "${lang.atLeastXsymbolsNeeded} $min";
                      return null;
                    }),
                country: UserInfoField(
                    textObject: country,
                    maxLength: 50,
                    hint: lang.birthcountry,
                    validator: (String text) {
                      int min = 2;
                      if (text.isEmpty || text.length < min)
                        return "${lang.atLeastXsymbolsNeeded} $min";
                      return null;
                    }),
                place: UserInfoField(
                    textObject: place,
                    maxLength: 100,
                    hint: lang.birthplace,
                    validator: (String text) {
                      int min = 2;
                      if (text.isEmpty || text.length < min)
                        return "${lang.atLeastXsymbolsNeeded} $min";
                      return null;
                    }),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GradientFlatButton(
          onPressed: () {
            print(name.text);
          },
          child: Text(
            lang.start.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 96.0,
            vertical: 16.0,
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
      ),
    );
  }
}
