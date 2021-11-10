import 'package:flutter/widgets.dart';
import 'package:my_horoskope/theme/app_text_style.dart';

class DailyScreenLabelAndBirth extends StatelessWidget {
  const DailyScreenLabelAndBirth({
    @required this.label,
    @required this.birthRow,
  });
  final String label;
  final Widget birthRow;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// {NAME} {ROLE}
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
            ),
            child: Text(
              label,
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
              child: birthRow,
            ),
          ),
        ],
      );
}
