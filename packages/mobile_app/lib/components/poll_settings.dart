import 'package:my_prophet/single_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:user_poll/bloc.dart';
import 'package:my_prophet/components/popup.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:language/language.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'magic_checkbox.dart';
import 'gradient_flatbutton.dart';

class PollSettings extends StatefulWidget {
  final Widget child;
  PollSettings({this.child});
  @override
  PollSettingsState createState() => PollSettingsState();
}

class PollSettingsState extends State<PollSettings> {
  MutableBool poll;
  MutableBool studying;
  SingleProvider sp;

  @override
  void initState() {
    sp = context.read<SingleProvider>();
    poll = MutableBool(sp.usersRepo.current.pollAvailability);
    studying = MutableBool(sp.usersRepo.current.pollStudying);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showOverCurrentScreen(
            context: context,
            child: SimpleTransperentScreen(
              height: 285,
              width: 300,
              title: lang.pollSettingsTitle.capitalize(),
              body: PollSettingInfo(poll: poll, studying: studying),
              actions: <Widget>[
                gradientFlatButton(
                  onPressed: () {
                    sp.userPollBloc.add(UserPollOnOffEvent(
                        availability: poll.wrapped,
                        studying: studying.wrapped));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    lang.apply.toUpperCase(),
                    style: AppTextStyle.gradientButton,
                  ),
                  padding: EdgeInsets.only(
                    top: 11,
                    bottom: 11,
                    left: 20,
                    right: 15,
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      AppColors.accentDark,
                      AppColors.accent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentDark,
                      offset: Offset(-1.0, 2.0),
                      blurRadius: 16,
                    )
                  ],
                ),
                SizedBox(width: 20),
              ],
            ));
      },
      child: (widget.child == null)
          ? Container(
              padding: EdgeInsets.only(
                left: 32,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              child: SvgPicture.asset(
                "assets/icons/gear.svg",
                width: 14,
                height: 14,
                color: AppColors.textSecondary,
              ),
            )
          : widget.child,
    );
  }
}

class PollSettingInfo extends StatefulWidget {
  final MutableBool poll;
  final MutableBool studying;
  PollSettingInfo({@required this.poll, @required this.studying});
  @override
  _PollSettingInfoState createState() => _PollSettingInfoState();
}

class _PollSettingInfoState extends State<PollSettingInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            lang.pollSettingText.capitalize(),
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              children: <Widget>[
                MagicCheckbox(value: widget.poll, onChanged: (_) {}),
                SizedBox(width: 20),
                Text(
                  lang.pollSettingPollOption.capitalize(),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            )),
        Container(
            margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 5.0,
            ),
            child: Row(
              children: <Widget>[
                MagicCheckbox(value: widget.studying, onChanged: (_) {}),
                SizedBox(width: 20),
                Flexible(
                  child: Text(
                    lang.pollSettingsStudyOption.capitalize(),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
