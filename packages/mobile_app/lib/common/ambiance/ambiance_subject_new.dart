import 'common.dart';

class AmbianceSubjectNew extends StatefulWidget {
  final Function onComplete;
  const AmbianceSubjectNew({Key key, @required this.onComplete})
      : super(key: key);

  @override
  _AmbianceSubjectNewState createState() => _AmbianceSubjectNewState();
}

class _AmbianceSubjectNewState extends State<AmbianceSubjectNew> {
  final name = MutableString("");
  final role = MutableString("");
  final month = MutableString("");
  final day = MutableString("");
  final year = MutableString("");
  final sex = MutableInteger(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        gradient: LinearGradient(
          colors: [
            AppColors.prophecyGradientStart,
            AppColors.prophecyGradientEnd,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        shrinkWrap: true,
        // we need scrolling if user will be in the album orientation or screen is too small
        scrollDirection: Axis.vertical,
        children: [
          // title
          Container(
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              color: AppColors.primaryDark,
            ),
            child: Center(
              child: Text(
                localeText.addAmbiance.capitalize(),
                style: AppTextStyle.popupTitle,
              ),
            ),
          ),
          // text
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              localeText.ambianceAddDescription,
              style: AppTextStyle.normalText,
            ),
          ),
          // user input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: AmbianceUserInputFields(
              name: name,
              role: role,
              day: day,
              month: month,
              year: year,
              sex: sex,
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          GradientFlatButton(
            // adding to the ambiance
            onPressed: () {
              print("${name.wrapped} ${role.wrapped}");
              widget.onComplete();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                localeText.add.toUpperCase(),
                style: AppTextStyle.normalText,
              ),
            ),
            borderRadius: BorderRadius.circular(32.0),
            gradient: LinearGradient(
              colors: <Color>[
                AppColors.accentDark,
                AppColors.accent,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
