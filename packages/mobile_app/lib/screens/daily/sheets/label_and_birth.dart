import 'package:flutter/widgets.dart';
import 'package:my_horoskope/logic/daily_screen/user_details_for_daily_screen.dart';
import 'package:my_horoskope/theme/app_text_style.dart';
import 'package:my_horoskope/widgets/common/birth_row.dart';

class LabelAndBirth extends StatelessWidget {
  const LabelAndBirth();

  @override
  Widget build(BuildContext context) {
    final userDetails = UserDetailsForDailyScreen.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// {NAME} {ROLE}
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
          ),
          child: Text(
            userDetails.label,
            style: AppTextStyle.userName,
          ),
        ),

        /// {Astrosign} {Birthdate}
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            bottom: 8.0,
          ),
          child: SizedBox(
            height: 32,
            child: BirthRow(
              info: BirthRowInfo(
                birthDate: userDetails.birthDate,
                astroSign: userDetails.astroSign,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
