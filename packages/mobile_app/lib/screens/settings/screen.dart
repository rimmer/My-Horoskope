import 'index.dart';

part 'prophecies_enabling.dart';

class ProfileSettingsScreen extends StatefulWidget {
  final name = MutableString("");
  final month = MutableString("");
  final day = MutableString("");
  final year = MutableString("");
  final sex = MutableInteger(0);
  final indexToSex = {
    0: localeText.notSelectedSex.capitalize(),
    1: localeText.male.capitalize(),
    2: localeText.female.capitalize(),
    3: localeText.other.capitalize(),
  };

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

    luck.wrapped = sp.appPref.enabledProphecies.luck;
    internalStrength.wrapped = sp.appPref.enabledProphecies.internalStrength;
    moodlet.wrapped = sp.appPref.enabledProphecies.moodlet;
    ambition.wrapped = sp.appPref.enabledProphecies.ambition;
    intelligence.wrapped = sp.appPref.enabledProphecies.intuition;

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
                label: localeText.profileSettings.capitalize(),
                onTap: () {
                  Navigator.pushNamed(context, '/menu');
                }),
            SizedBox(height: 8.0),
            //

            /// prophecies enabling/disabling
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                localeText.propheciesToDisplay.capitalize(),
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
                localeText.personalInformation.capitalize(),
                style: AppTextStyle.backgroundLabel,
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
                validInformationCheck: () {
                  if (widget.name.wrapped.isEmpty) {
                    showOverCurrentScreen(
                      context: context,
                      child: wrongInformation(localeText.nameNotFilled),
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
                      child: wrongInformation(localeText.dateNotFilled),
                    );
                    return false;
                  }
                  return true;
                },
                onValidInformation: () {
                  final propheciesToShow = EnabledProphecies(
                    luck: luck.wrapped,
                    intuition: intelligence.wrapped,
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
                          widget.sex.wrapped == user.sex;

                  final propheciesToShowNotChanged =
                      sp.appPref.enabledProphecies.luck == luck.wrapped &&
                          sp.appPref.enabledProphecies.intuition ==
                              intelligence.wrapped &&
                          sp.appPref.enabledProphecies.internalStrength ==
                              internalStrength.wrapped &&
                          sp.appPref.enabledProphecies.ambition ==
                              ambition.wrapped &&
                          sp.appPref.enabledProphecies.moodlet ==
                              moodlet.wrapped;

                  if (userSettingsNotChanged && propheciesToShowNotChanged) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/daily', (Route<dynamic> route) => false);
                    return;
                  }

                  sp.appPref.enabledProphecies = propheciesToShow;

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
                  );

                  /// services/direct_auth.dart
                  if (user.birth == birthDateEntered)
                    userInformationChangeMisc(
                        sp: sp, model: enteredUserModel, context: context);
                  else
                    userInformationChangeMajor(
                        sp: sp, model: enteredUserModel, context: context);
                },
                buttonText: localeText.save.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
