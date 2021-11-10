import 'package:base/user/entity/user.dart';
import 'package:flutter/widgets.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_subject_item.dart';

class DailyScreenAmbianceList extends StatelessWidget {
  const DailyScreenAmbianceList({
    @required this.getCompatibility,
    @required this.ambiance,
    @required this.focusAmbianceChange,
    @required this.setAmbianceChangeSubject,
  });

  final double Function(UserEntity subject) getCompatibility;
  final List<UserEntity> ambiance;
  final Function() focusAmbianceChange;
  final Function(UserEntity subject) setAmbianceChangeSubject;

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: ambiance.length,
        itemBuilder: (context, index) {
          final subject = ambiance[index];
          return AmbiacneSubject(
            onOptionsTap: () {
              setAmbianceChangeSubject(subject);
              focusAmbianceChange();
            },
            subject: subject,
            compatibility: getCompatibility(subject),
          );
        },
      );
}
