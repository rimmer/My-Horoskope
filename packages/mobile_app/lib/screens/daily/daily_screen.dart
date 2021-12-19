import 'package:flutter/material.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_compatibility.dart';
import 'package:my_horoskope/models/user_details_for_daily_screen.dart';
import 'package:my_horoskope/screens/daily/foundation/popup_stack.dart';

class DailyScreen extends StatelessWidget {
  const DailyScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: UserDetailsForDailyScreen(
          user: AppGlobal.data.usersRepo.current,
          propheciesToShow: AppGlobal.data.appPref.enabledProphecies,
          child: AmbianceCompatibility(
            forUser: AppGlobal.data.usersRepo.current,
            child: const PopupStackForDailyScreen(),
          ),
        ),
      );
}
