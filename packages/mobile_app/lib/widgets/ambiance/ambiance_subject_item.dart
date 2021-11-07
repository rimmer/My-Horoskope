import 'common.dart';

class AmbiacneSubject extends StatelessWidget {
  final Function onOptionsTap;
  final UserEntity subject;
  final double compatibility;
  const AmbiacneSubject({
    Key key,
    @required this.onOptionsTap,
    @required this.subject,
    @required this.compatibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sign = subject.model.birth.astroSign;
    final birthDate = subject.model.birth.toDateTime;
    final isNegative = (compatibility - 50.0) < 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// {NAME} {ROLE}
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              "${subject.model.name.capitalize()} (${subject.role.capitalize()})",
              style: AppTextStyle.userName,
            ),
          ),
        ),

        /// {Astrosign} {Birthdate}
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SizedBox(
            height: 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/icons/$sign.svg"),
                Text(
                  " ${birthDate.day}.${birthDate.month}.${birthDate.year} ",
                  style: AppTextStyle.normalText,
                ),
                Expanded(
                  child: const SizedBox(),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    color: AppColors.textPrimary,
                    size: 24.0,
                  ),
                  onPressed: onOptionsTap,
                ),
              ],
            ),
          ),
        ),

        /// compatibility
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            gradient: SheetGradient(),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  localeText.compatibility.capitalize(),
                  style: AppTextStyle.prophecyLabel,
                ),
              ),
              SizedBox(
                height: 8.0,
                width: 8.0,
                child: CustomPaint(
                  painter: TrianglePainter(isNegative: isNegative),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                "${compatibility.toStringAsFixed(0)}%",
                style: AppTextStyle.prophecyPercent,
              )
            ],
          ),
        ),
      ],
    );
  }
}
