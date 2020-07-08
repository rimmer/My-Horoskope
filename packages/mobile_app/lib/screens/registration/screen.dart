import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/components/userinfo_field.dart';
import 'package:app/components/gradient_flatbutton.dart';

class RegistrationScreen extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'assets/launcher/icon.png',
                height: 128,
                width: 128,
              ),
              Column(
                children: <Widget>[
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
                  Text("offline"),
                ],
              ),
              UserInfoField(
                  hint: lang.name,
                  validator: (String text) {
                    return null;
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lang.birthdate),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: UserInfoField(
                              padding: EdgeInsets.only(right: 16),
                              keyboardType: TextInputType.datetime,
                              hint: "mm",
                              validator: (String text) {
                                return null;
                              }),
                        ),
                        Expanded(
                          flex: 2,
                          child: UserInfoField(
                              padding: EdgeInsets.only(right: 16),
                              keyboardType: TextInputType.datetime,
                              hint: "dd",
                              validator: (String text) {
                                return null;
                              }),
                        ),
                        Expanded(
                          flex: 3,
                          child: UserInfoField(
                              padding: EdgeInsets.only(right: 16),
                              keyboardType: TextInputType.datetime,
                              hint: "yyyy",
                              validator: (String text) {
                                return null;
                              }),
                        ),
                        Expanded(flex: 3, child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lang.sex),
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: UserInfoField(
                                padding: EdgeInsets.only(right: 0),
                                hint: lang.notSelectedSex,
                                validator: (String text) {
                                  return null;
                                })),
                        Expanded(flex: 6, child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              UserInfoField(
                  hint: lang.birthcountry,
                  validator: (String text) {
                    return null;
                  }),
              UserInfoField(
                  hint: lang.birthplace,
                  validator: (String text) {
                    return null;
                  }),
              SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GradientFlatButton(
          onPressed: () {},
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
