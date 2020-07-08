import 'package:flutter/material.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/components/userinfo.dart';
import 'package:app/components/gradient_flatbutton.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: UserInfo(),
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
            blurRadius: 12,
          )
        ],
      ),
    );
  }
}
