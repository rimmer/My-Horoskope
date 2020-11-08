import 'index.dart';

class RegistrationScreen extends StatelessWidget {
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
  final termsAccepted = MutableBool(false);

  @override
  Widget build(BuildContext context) {
    /// getting single provider
    final sp = context.watch<SingleProvider>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
          ),
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset(
                'assets/launcher/icon.png',
                height: 96,
                width: 96,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Daily ",
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "AI ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Horoscope",
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "offline",
                style: TextStyle(color: AppColors.textDisabled),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            userSettingsList(
              name: name,
              month: month,
              day: day,
              year: year,
              sex: sex,
              indexToSex: indexToSex,
              country: country,
              place: place,
              termsAccepted: termsAccepted,
              onUnvalidInformation: () {
                showOverCurrentScreen(
                    context: context,
                    child: wrongInformation(lang.notAllFieldsFilled));
              },
              onUnvalidTerms: () {
                showOverCurrentScreen(
                    context: context,
                    child: wrongInformation(lang.termsAreNotAccepted));
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
              buttonText: lang.start.toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}
