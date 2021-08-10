import 'index.dart';

part 'prophecies_enabling.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  UserModel user;

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
  final MutableBool luck = MutableBool(true);
  final MutableBool internalStrength = MutableBool(true);
  final MutableBool moodlet = MutableBool(true);
  final MutableBool ambition = MutableBool(true);
  final MutableBool intelligence = MutableBool(true);

  @override
  void initState() {
    /// setting current values
    user = AppGlobal.data.usersRepo.current.model;
    name.wrapped = user.name;
    final birthDate = DateTime.fromMillisecondsSinceEpoch(user.birth);
    month.wrapped = (birthDate.month).toString();
    if (month.wrapped.length == 1) month.wrapped = "0${month.wrapped}";
    day.wrapped = birthDate.day.toString();
    year.wrapped = birthDate.year.toString();
    sex.wrapped = user.sex;

    luck.wrapped = AppGlobal.data.appPref.enabledProphecies.luck;
    internalStrength.wrapped =
        AppGlobal.data.appPref.enabledProphecies.internalStrength;
    moodlet.wrapped = AppGlobal.data.appPref.enabledProphecies.moodlet;
    ambition.wrapped = AppGlobal.data.appPref.enabledProphecies.ambition;
    intelligence.wrapped = AppGlobal.data.appPref.enabledProphecies.intuition;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: const AppBackground(),
          ),
          Positioned.fill(
            child: SafeArea(
              child: ListView(
                children: [
                  MyProphetAppBar(
                      width: screen.width,
                      label: localeText.profileSettings.capitalize(),
                      onTap: () {
                        Navigator.pushNamed(context, '/menu');
                      }),
                  const SizedBox(height: 8.0),
                  //

                  /// prophecies enabling/disabling
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 8.0),
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: PropheciesEnabling(
                      luck: luck,
                      internalStrength: internalStrength,
                      moodlet: moodlet,
                      ambition: ambition,
                      intelligence: intelligence,
                    ),
                  ),

                  /// profile-settings
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      localeText.personalInformation.capitalize(),
                      style: AppTextStyle.backgroundLabel,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: UserSettingsList(
                      name: name,
                      month: month,
                      day: day,
                      year: year,
                      sex: sex,
                      indexToSex: indexToSex,
                      validInformationCheck: () {
                        if (name.wrapped.isEmpty) {
                          showOverCurrentScreen(
                            context: context,
                            child: wrongInformation(localeText.nameNotFilled),
                          );
                          return false;
                        }
                        if (day.wrapped.isEmpty ||
                            month.wrapped.isEmpty ||
                            year.wrapped.isEmpty ||
                            int.parse(year.wrapped) > upperYearBound(12) ||
                            int.parse(year.wrapped) < 1921 ||
                            int.parse(month.wrapped) > 12 ||
                            int.parse(month.wrapped) < 1 ||
                            int.parse(day.wrapped) > 31 ||
                            int.parse(day.wrapped) < 1) {
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
                          int.parse(year.wrapped),
                          int.parse(month.wrapped),
                          int.parse(day.wrapped),
                        ).millisecondsSinceEpoch;

                        final userSettingsNotChanged =
                            name.wrapped == user.name &&
                                birthDateEntered == user.birth &&
                                sex.wrapped == user.sex;

                        final propheciesToShowNotChanged = AppGlobal
                                    .data.appPref.enabledProphecies.luck ==
                                luck.wrapped &&
                            AppGlobal
                                    .data.appPref.enabledProphecies.intuition ==
                                intelligence.wrapped &&
                            AppGlobal.data.appPref.enabledProphecies
                                    .internalStrength ==
                                internalStrength.wrapped &&
                            AppGlobal.data.appPref.enabledProphecies.ambition ==
                                ambition.wrapped &&
                            AppGlobal.data.appPref.enabledProphecies.moodlet ==
                                moodlet.wrapped;

                        if (userSettingsNotChanged &&
                            propheciesToShowNotChanged) {
                          Navigator.of(context).pushNamed(AppPath.daily);
                          return;
                        }

                        AppGlobal.data.appPref.enabledProphecies =
                            propheciesToShow;

                        if (userSettingsNotChanged) {
                          Navigator.of(context).pushNamed(AppPath.daily);
                          return;
                        }

                        /// it is better to calculate it once
                        final enteredUserModel = UserModel(
                          name: name.wrapped,
                          birth: birthDateEntered,
                          sex: sex.wrapped,
                        );

                        /// services/direct_auth.dart
                        if (user.birth == birthDateEntered)
                          userInformationChangeMisc(
                              model: enteredUserModel, context: context);
                        else
                          userInformationChangeMajor(
                              model: enteredUserModel, context: context);
                      },
                      buttonText: localeText.save.toUpperCase(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
