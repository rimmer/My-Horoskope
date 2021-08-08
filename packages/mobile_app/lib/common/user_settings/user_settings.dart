import 'index.dart';

typedef bool ReturnsTrueOnCorrect();

int upperYearBound(int bound) => DateTime.now().year - bound;

class UserSettingsList extends StatelessWidget {
  final MutableString name;
  final MutableString month;
  final MutableString day;
  final MutableString year;
  final MutableInteger sex;
  final Map<int, String> indexToSex;
  final MutableBool termsAccepted;
  final Function onUnvalidTerms;
  final ReturnsTrueOnCorrect validInformationCheck;
  final Function onValidInformation;
  final String buttonText;

  UserSettingsList({
    @required this.name,
    @required this.month,
    @required this.day,
    @required this.year,
    @required this.sex,
    @required this.indexToSex,

    /// defaultIsNull
    this.termsAccepted,
    this.onUnvalidTerms,
    //
    @required this.validInformationCheck,
    @required this.onValidInformation,
    @required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Column(
      children: <Widget>[
        UserInfo(
          name: UserInfoField(
              textObject: name,
              maxLength: 100,
              keyboardType: TextInputType.name,
              capitalizationType: TextCapitalization.words,
              hint: localeText.name.capitalize(),
              onEditingComplete: () => node.nextFocus(),
              validator: (String text) {
                int min = 2;
                if (text.isEmpty || text.length < min)
                  return "${localeText.atLeastXsymbolsNeeded} $min";
                return null;
              }),
          day: UserInfoField(
              textObject: day,
              maxLength: 2,
              keyboardType: TextInputType.datetime,
              hint: "dd",
              onEditingComplete: () => node.nextFocus(),
              validator: (String text) {
                int min = 1;
                if (text.isEmpty || text.length < min)
                  return "${text.length}/$min";
                if (int.parse(text) > 31 || int.parse(text) < 1) return "x";
                if (text.length == 1 && int.parse(text) > 3) node.nextFocus();
                if (text.length == 2) node.nextFocus();
                return null;
              }),
          month: UserInfoField(
              textObject: month,
              maxLength: 2,
              keyboardType: TextInputType.datetime,
              hint: "mm",
              onEditingComplete: () => node.nextFocus(),
              validator: (String text) {
                int min = 1;
                if (text.isEmpty || text.length < min)
                  return "${text.length}/$min";
                if (int.parse(text) > 12 || int.parse(text) < 1) return "x";
                if (text.length == 1 && int.parse(text) > 1) node.nextFocus();
                if (text.length == 2) node.nextFocus();
                return null;
              }),
          year: UserInfoField(
              textObject: year,
              maxLength: 4,
              keyboardType: TextInputType.datetime,
              hint: "yyyy",
              onEditingComplete: () => node.unfocus(),
              validator: (String text) {
                int min = 4;
                if (text.isEmpty || text.length < min)
                  return "${text.length}/$min";
                if (int.parse(text) > upperYearBound(12) ||
                    int.parse(text) < 1921) return "x";
                if (text.length == 4) node.nextFocus();
                return null;
              }),
          sex: UserInfoPicker(
            items: indexToSex,
            indexObject: sex,
          ),
        ),
        (termsAccepted != null)
            ? AcceptTermsRow(terms: termsAccepted)
            : SizedBox(
                height: 0.0,
              ),
        SizedBox(
          height: 24,
        ),
        GradientFlatButton(
          onPressed: () {
            // // @DEBUG
            // print("Name ${name.wrapped}");
            // print("Month: ${month.wrapped}");
            // print("Day: ${day.wrapped}");
            // print("Year: ${year.wrapped}");
            // print("Sex: ${indexToSex[sex.wrapped]}");
            // print("Country: ${country.wrapped}");
            // print("Place: ${place.wrapped}");

            if (validInformationCheck() == false) return;

            if (termsAccepted != null && termsAccepted.wrapped == false) {
              if (onUnvalidTerms == null) {
                throw ("You provided termsAccepted without onUnvalidTerms action.");
              } else
                onUnvalidTerms();
              return;
            }

            //
            onValidInformation();
          },
          child: Text(
            buttonText,
            style: AppTextStyle.labelText,
          ),
          padding: EdgeInsets.symmetric(
            /// padding for a gradient button
            vertical: 16.0,
            horizontal: 64.0,
          ),
          gradient: LinearGradient(
            colors: <Color>[
              AppColors.accentDark,
              AppColors.accent,
            ],
          ),
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.accentDark,
              offset: Offset(-1.0, 2.0),
              blurRadius: 16,
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

Container wrongInformation(String title) => Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 32.0),
      child: Text(
        title,
        style: TextStyle(color: AppColors.textPrimary, fontSize: 22),
      ),
    );
