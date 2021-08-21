import 'common.dart';

class AmbianceSubjectChange extends StatefulWidget {
  final UserEntity subject;
  final Function onComplete;
  const AmbianceSubjectChange({
    Key key,
    @required this.subject,
    @required this.onComplete,
  }) : super(key: key);

  @override
  _AmbianceSubjectChangeState createState() => _AmbianceSubjectChangeState();
}

class _AmbianceSubjectChangeState extends State<AmbianceSubjectChange> {
  final name = MutableString("");
  final role = MutableString("");
  final month = MutableString("");
  final day = MutableString("");
  final year = MutableString("");
  final sex = MutableInteger(0);

  @override
  void initState() {
    name.wrapped = widget.subject.model.name;
    final birthDate =
        DateTime.fromMillisecondsSinceEpoch(widget.subject.model.birth);
    month.wrapped = (birthDate.month).toString();
    if (month.wrapped.length == 1) month.wrapped = "0${month.wrapped}";
    day.wrapped = birthDate.day.toString();
    year.wrapped = birthDate.year.toString();
    sex.wrapped = widget.subject.model.sex;
    role.wrapped = widget.subject.role;
    //

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        gradient: SheetGradient(),
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
                name.wrapped,
                style: AppTextStyle.popupTitle,
              ),
            ),
          ),
          // delete
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 8.0,
            ),
            child: GradientBorderButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  localeText.delete.toUpperCase(),
                  style: AppTextStyle.normalText,
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.accentDark,
                  AppColors.accent,
                  AppColors.primary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderAsPadding: const EdgeInsets.all(1.0),
              background: AppColors.primaryDark,
              internalPadding:
                  const EdgeInsets.symmetric(horizontal: 38, vertical: 12.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              onPressed: () {
                //

                AppGlobal.data.usersRepo.current
                    .removeAmbianceSubject(widget.subject);
                AppGlobal.data.usersRepo.write();

                widget.onComplete();
              },
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
            onPressed: () {
              if (name.wrapped.isEmpty ||
                  role.wrapped.isEmpty ||
                  day.wrapped.isEmpty ||
                  month.wrapped.isEmpty ||
                  year.wrapped.isEmpty ||
                  int.parse(month.wrapped) > 12 ||
                  int.parse(month.wrapped) < 1 ||
                  int.parse(day.wrapped) > 31 ||
                  int.parse(day.wrapped) < 1) return;

              final subjectUpdate = UserEntity(
                model: UserModel(
                  name: name.wrapped,
                  birth: DateTime.utc(
                    int.parse(year.wrapped),
                    int.parse(month.wrapped),
                    int.parse(day.wrapped),
                  ).millisecondsSinceEpoch,
                  sex: sex.wrapped,
                ),
                role: role.wrapped,
              );

              AppGlobal.data.usersRepo.current.updateAmbianceSubject(
                widget.subject,
                subjectUpdate,
              );
              AppGlobal.data.usersRepo.write();

              widget.onComplete();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                localeText.save.toUpperCase(),
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
