import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_poll/bloc.dart';
import 'package:app/components/popup.dart';
import 'package:app/theme/app_colors.dart';
import 'package:language/language.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:users_repository/users_repository.dart';
import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'magic_checkbox.dart';
import 'gradient_flatbutton.dart';

class PollSettings extends StatefulWidget {
  @override
  PollSettingsState createState() => PollSettingsState();
}

class PollSettingsState extends State<PollSettings> {
  MutableBool poll;
  MutableBool studying;
  UsersRepository usersRepo;
  UserPollBloc pollBloc;

  @override
  void initState() {
    usersRepo = context.read<UsersRepositoryFlutter>();
    pollBloc = context.bloc<UserPollBloc>();
    poll = MutableBool(usersRepo.current.pollAvailability);
    studying = MutableBool(usersRepo.current.pollStudying);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlert(
            context: context,
            child: SimplePopup(
              title: lang.pollSettingsTitle.capitalize(),
              body: PollSettingInfo(poll: poll, studying: studying),
              actions: <Widget>[
                GradientFlatButton(
                  onPressed: () {
                    usersRepo.pollSettingsSetter(
                        availability: poll.wrapped, studying: studying.wrapped);
                    pollBloc.add(PollUsed(
                        poll: pollBloc.currentPoll, enabled: poll.wrapped));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    lang.apply.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
      child: Container(
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
      ),
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
              top: 20.0,
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
              top: 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Row(
              children: <Widget>[
                MagicCheckbox(value: widget.studying, onChanged: (_) {}),
                SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        lang.pollSettingsStudyOption1.capitalize(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        lang.pollSettingsStudyOption2,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
