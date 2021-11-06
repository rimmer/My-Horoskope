import 'exports_for_register_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    final termsAccepted = MutableBool(false);

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: const AppBackground(),
          ),
          Positioned.fill(
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
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
                  const SizedBox(
                    height: 8.0,
                  ),
                  UserSettingsList(
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
                    onUnvalidTerms: () {
                      showOverCurrentScreen(context: context, child: wrongInformation(localeText.termsAreNotAccepted));
                    },
                    onValidInformation: () {
                      AppGlobal.authBloc.add(AuthEvent(UserModel(
                        name: name.wrapped,
                        birth: DateTime.utc(
                          int.parse(year.wrapped),
                          int.parse(month.wrapped),
                          int.parse(day.wrapped),
                        ).millisecondsSinceEpoch,
                        sex: sex.wrapped,
                      )));
                      AppGlobal.firebase.analytics.logSignUp(signUpMethod: "local");
                    },
                    buttonText: localeText.start.toUpperCase(),
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
