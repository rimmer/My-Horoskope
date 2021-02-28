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
                'assets/splash.png',
                height: 120,
                width: 120,
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
              termsAccepted: termsAccepted,
              validInformationCheck: () {
                if (name.wrapped.isEmpty) {
                  showOverCurrentScreen(
                    context: context,
                    child: wrongInformation(lang.nameNotFilled),
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
                    child: wrongInformation(lang.dateNotFilled),
                  );
                  return false;
                }
                return true;
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
