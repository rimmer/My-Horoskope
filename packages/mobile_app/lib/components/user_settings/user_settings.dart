import 'index.dart';

Column userSettingsList({
  @required MutableString name,
  @required MutableString month,
  @required MutableString day,
  @required MutableString year,
  @required MutableInteger sex,
  @required Map<int, String> indexToSex,
  @required MutableString country,
  @required MutableString place,

  /// defaultIsNull
  MutableBool termsAccepted,
  Function onUnvalidTerms,
  //
  @required Function onUnvalidInformation,
  @required Function onValidInformation,
  @required String buttonText,
}) =>
    Column(
      children: <Widget>[
        userInfo(
          name: UserInfoField(
              textObject: name,
              maxLength: 100,
              hint: lang.name.capitalize(),
              validator: (String text) {
                int min = 2;
                if (text.isEmpty || text.length < min)
                  return "${lang.atLeastXsymbolsNeeded} $min";
                return null;
              }),
          month: UserInfoField(
              textObject: month,
              maxLength: 2,
              keyboardType: TextInputType.datetime,
              hint: "mm",
              validator: (String text) {
                int min = 1;
                if (text.isEmpty || text.length < min)
                  return "${text.length}/$min";
                if (int.parse(text) > 12 || int.parse(text) < 1) return "x";
                return null;
              }),
          day: UserInfoField(
              textObject: day,
              maxLength: 2,
              keyboardType: TextInputType.datetime,
              hint: "dd",
              validator: (String text) {
                int min = 1;
                if (text.isEmpty || text.length < min)
                  return "${text.length}/$min";
                if (int.parse(text) > 31 || int.parse(text) < 1) return "x";
                return null;
              }),
          year: UserInfoField(
              textObject: year,
              maxLength: 4,
              keyboardType: TextInputType.datetime,
              hint: "yyyy",
              validator: (String text) {
                int min = 4;
                if (text.isEmpty || text.length < min)
                  return "${text.length}/$min";
                return null;
              }),
          sex: UserInfoPicker(
            items: indexToSex,
            indexObject: sex,
          ),
          country: UserInfoField(
              textObject: country,
              maxLength: 50,
              hint: lang.birthcountry.capitalize(),
              validator: (String text) {
                return null;
              }),
          place: UserInfoField(
              textObject: place,
              maxLength: 160,
              hint: lang.birthplace.capitalize(),
              validator: (String text) {
                return null;
              }),
        ),
        (termsAccepted != null)
            ? AcceptTermsRow(terms: termsAccepted)
            : SizedBox(
                height: 0.0,
              ),
        SizedBox(
          height: 24,
        ),
        gradientFlatButton(
          onPressed: () {
            // // @DEBUG
            // print("Name ${name.wrapped}");
            // print("Month: ${month.wrapped}");
            // print("Day: ${day.wrapped}");
            // print("Year: ${year.wrapped}");
            // print("Sex: ${indexToSex[sex.wrapped]}");
            // print("Country: ${country.wrapped}");
            // print("Place: ${place.wrapped}");

            if (name.wrapped.isEmpty ||
                month.wrapped.isEmpty ||
                day.wrapped.isEmpty ||
                year.wrapped.isEmpty) {
              //
              onUnvalidInformation();
              return;
              //
            }

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
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          padding: EdgeInsets.symmetric(
            /// padding for a gradient button
            vertical: 16.0,
            horizontal: 109.0,
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

Container wrongInformation(String title) => Container(
      color: Colors.transparent,
      child: Text(
        title,
        style: TextStyle(color: AppColors.textPrimary),
      ),
    );
