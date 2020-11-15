import 'index.dart';

class ProfileSettingsScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    /// getting single provider
    final sp = context.watch<SingleProvider>();

    /// setting current values
    final user = sp.usersRepo.current.model;
    name.wrapped = user.name;
    final birthDate = DateTime.fromMillisecondsSinceEpoch(user.birth);
    month.wrapped = (birthDate.month).toString();
    if (month.wrapped.length == 1) month.wrapped = "0${month.wrapped}";
    day.wrapped = birthDate.day.toString();
    year.wrapped = birthDate.year.toString();
    sex.wrapped = user.sex;
    country.wrapped = user.country;
    place.wrapped = user.place;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            myProphetAppBar(
                width: screen.width,
                label: lang.profileSettings.capitalize(),
                onTap: () {
                  Navigator.pushNamed(context, '/menu');
                }),
            SizedBox(height: 8.0),
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
                name: name,
                month: month,
                day: day,
                year: year,
                sex: sex,
                indexToSex: indexToSex,
                country: country,
                place: place,
                onUnvalidInformation: () {
                  showOverCurrentScreen(
                      context: context,
                      child: wrongInformation(lang.notAllFieldsFilled));
                },
                onValidInformation: () {
                  sp.authBloc.add(AuthEvent(UserModel(
                    name: name.wrapped,
                    birth: DateTime.utc(
                      int.parse(year.wrapped),
                      int.parse(month.wrapped),
                      int.parse(day.wrapped),
                    ).millisecondsSinceEpoch,
                    sex: sex.wrapped,
                    country: country.wrapped,
                    place: place.wrapped,
                  )));
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
