import 'package:flutter/material.dart';
import 'package:my_horoskope/logic/daily_screen/ambiance_popups_logic.dart';
import 'package:my_horoskope/screens/daily/foundation/fadeout_animation_wrapper.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_subject_new.dart';
import 'package:my_horoskope/widgets/ambiance/ambiance_subject_settings.dart';
import 'package:my_horoskope/widgets/common/app_background.dart';

class PopupStackForDailyScreen extends StatelessWidget {
  const PopupStackForDailyScreen();

  @override
  Widget build(BuildContext context) => AmbiancePopupsLogic(
        child: AmbiancePopupStack(),
      );
}

class AmbiancePopupStack extends StatefulWidget {
  const AmbiancePopupStack();

  @override
  _AmbiancePopupStackState createState() => _AmbiancePopupStackState();
}

class _AmbiancePopupStackState extends State<AmbiancePopupStack> {
  @override
  Widget build(BuildContext context) {
    final logic = AmbiancePopupsLogic.of(context);

    return Stack(
      children: [
        const Positioned.fill(
          child: const AppBackground(),
        ),
        const Positioned.fill(
          child: const SafeArea(
            child: const FadeOutAnimationWrapper(),
          ),
        ),

        /// Ambiance popups
        if (logic.ambianceAdd || logic.ambianceChange)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => logic.unfocusAmbiancePopup(),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        if (logic.ambianceAdd)
          Align(
            alignment: Alignment.center,
            child: AmbianceSubjectNew(
              onComplete: () => logic.unfocusAmbiancePopup(),
            ),
          ),
        if (logic.ambianceChange)
          Align(
            alignment: Alignment.center,
            child: AmbianceSubjectChange(
              onComplete: () => logic.unfocusAmbiancePopup(),
              subject: logic.subjectToChange,
            ),
          ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    AmbiancePopupsLogic.of(context).addListener(() {
      try {
        setState(() {});
      } catch (_) {}
    });
    super.didChangeDependencies();
  }
}
