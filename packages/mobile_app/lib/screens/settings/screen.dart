import 'package:prophecy_to_show/prophecy_to_show.dart';

import 'index.dart';

part 'prophecies_enabling.dart';

class ProfileSettingsScreen extends StatefulWidget {
  final name = MutableString("");
  final month = MutableString("");
  final day = MutableString("");
  final year = MutableString("");
  final sex = MutableInteger(0);
  final indexToSex = {
    0: lang.notSelectedSex.capitalize(),
    1: lang.male.capitalize(),
    2: lang.female.capitalize(),
    3: lang.other.capitalize(),
  };
  final country = MutableString("");
  final place = MutableString("");

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  SingleProvider sp;
  UserModel user;

  final MutableBool luck = MutableBool(true);
  final MutableBool internalStrength = MutableBool(true);
  final MutableBool moodlet = MutableBool(true);
  final MutableBool ambition = MutableBool(true);
  final MutableBool intelligence = MutableBool(true);

  @override
  void initState() {
    /// getting single provider
    sp = context.read<SingleProvider>();

    /// setting current values
    user = sp.usersRepo.current.model;
    widget.name.wrapped = user.name;
    final birthDate = DateTime.fromMillisecondsSinceEpoch(user.birth);
    widget.month.wrapped = (birthDate.month).toString();
    if (widget.month.wrapped.length == 1)
      widget.month.wrapped = "0${widget.month.wrapped}";
    widget.day.wrapped = birthDate.day.toString();
    widget.year.wrapped = birthDate.year.toString();
    widget.sex.wrapped = user.sex;
    widget.country.wrapped = user.country;
    widget.place.wrapped = user.place;

    luck.wrapped = sp.show.enabledProphecies.luck;
    internalStrength.wrapped = sp.show.enabledProphecies.internalStrength;
    moodlet.wrapped = sp.show.enabledProphecies.moodlet;
    ambition.wrapped = sp.show.enabledProphecies.ambition;
    intelligence.wrapped = sp.show.enabledProphecies.intelligence;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: ListView(
          children: [
            myProphetAppBar(
                width: screen.width,
                label: lang.profileSettings.capitalize(),
                onTap: () {
                  Navigator.pushNamed(context, '/menu');
                }),
            SizedBox(height: 8.0),
            //

            /// prophecies enabling/disabling
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                lang.propheciesToDisplay.capitalize(),
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              color: AppColors.primary.withOpacity(0.3),
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: propheciesEnabling(
                luck: luck,
                internalStrength: internalStrength,
                moodlet: moodlet,
                ambition: ambition,
                intelligence: intelligence,
              ),
            ),

            /// profile-settings
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                lang.personalInformation.capitalize(),
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: userSettingsList(
                name: widget.name,
                month: widget.month,
                day: widget.day,
                year: widget.year,
                sex: widget.sex,
                indexToSex: widget.indexToSex,
                country: widget.country,
                place: widget.place,
                validInformationCheck: () {
                  if (widget.name.wrapped.isEmpty) {
                    showOverCurrentScreen(
                      context: context,
                      child: wrongInformation(lang.nameNotFilled),
                    );
                    return false;
                  }
                  if (widget.day.wrapped.isEmpty ||
                      widget.month.wrapped.isEmpty ||
                      widget.year.wrapped.isEmpty ||
                      int.parse(widget.year.wrapped) > upperYearBound(12) ||
                      int.parse(widget.year.wrapped) < 1921 ||
                      int.parse(widget.month.wrapped) > 12 ||
                      int.parse(widget.month.wrapped) < 1 ||
                      int.parse(widget.day.wrapped) > 31 ||
                      int.parse(widget.day.wrapped) < 1) {
                    showOverCurrentScreen(
                      context: context,
                      child: wrongInformation(lang.dateNotFilled),
                    );
                    return false;
                  }
                  return true;
                },
                onValidInformation: () {
                  final propheciesToShow = EnabledProphecies(
                    luck: luck.wrapped,
                    intelligence: intelligence.wrapped,
                    internalStrength: internalStrength.wrapped,
                    ambition: ambition.wrapped,
                    moodlet: moodlet.wrapped,
                  );

                  /// it is better to calculate it once
                  final birthDateEntered = DateTime.utc(
                    int.parse(widget.year.wrapped),
                    int.parse(widget.month.wrapped),
                    int.parse(widget.day.wrapped),
                  ).millisecondsSinceEpoch;

                  final userSettingsNotChanged =
                      widget.name.wrapped == user.name &&
                          birthDateEntered == user.birth &&
                          widget.sex.wrapped == user.sex &&
                          widget.country.wrapped == user.country &&
                          widget.place.wrapped == user.place;

                  final propheciesToShowNotChanged =
                      sp.show.enabledProphecies.luck == luck.wrapped &&
                          sp.show.enabledProphecies.intelligence ==
                              intelligence.wrapped &&
                          sp.show.enabledProphecies.internalStrength ==
                              internalStrength.wrapped &&
                          sp.show.enabledProphecies.ambition ==
                              ambition.wrapped &&
                          sp.show.enabledProphecies.moodlet == moodlet.wrapped;

                  if (userSettingsNotChanged && propheciesToShowNotChanged) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/daily', (Route<dynamic> route) => false);
                    return;
                  }

                  sp.show.enabledProphecies = propheciesToShow;

                  if (userSettingsNotChanged) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/daily', (Route<dynamic> route) => false);
                    return;
                  }

                  /// it is better to calculate it once
                  final enteredUserModel = UserModel(
                    name: widget.name.wrapped,
                    birth: birthDateEntered,
                    sex: widget.sex.wrapped,
                    country: widget.country.wrapped,
                    place: widget.place.wrapped,
                  );

                  /// services/direct_auth.dart
                  if (user.birth == birthDateEntered)
                    userInformationChangeMisc(
                        sp: sp, model: enteredUserModel, context: context);
                  else
                    userInformationChangeMajor(
                        sp: sp, model: enteredUserModel, context: context);
                },
                buttonText: lang.save.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
