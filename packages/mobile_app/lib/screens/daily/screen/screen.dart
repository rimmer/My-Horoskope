/// all imports are here
import 'index.dart';

part 'data.dart';
part 'methods/calendar_builder.dart';
part 'methods/prophecy_builder.dart';
part 'methods/prediction.dart';
part 'methods/misc.dart';
part 'methods/not_available_button.dart';

class DailyScreen extends StatefulWidget {
  /// current and next NUMBER_OF_DAYS_TO_SHOW days DateTime
  final List<DateTime> day = [];

  /// current day to show index
  final currentIndex = MutableInteger(0);

  DailyScreen({Key key}) : super(key: key) {
    //

    final today = DateTime.fromMillisecondsSinceEpoch(dtDay);
    day.add(today);

    /// fills the list with all other days
    for (int d = 1; d <= NUMBER_OF_DAYS_TO_SHOW; d++)
      day.add(today.add(new Duration(days: d)));
  }

  @override
  _DailyScreenState createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  //
  SingleProvider sp;
  final dat = DailyStateData();

  @override
  void dispose() {
    super.dispose();
  }

  /// @INIT
  @override
  void initState() {
    sp = context.read<SingleProvider>();
    //

    dat.user = sp.usersRepo.current;
    dat.labelStr =
        "${dat.user.model.name.capitalize()} (${localeText.you.capitalize()})";
    dat.sign = dat.user.model.birth.astroSign;

    final dtConverted = dat.user.model.birth.toDateTime;

    dat.birthRow = Row(
      children: <Widget>[
        SvgPicture.asset("assets/icons/${dat.sign}.svg"),
        Text(" ${dtConverted.day}.${dtConverted.month}.${dtConverted.year} ",
            style: AppTextStyle.normalText),
      ],
    );

    calculateProphecy();

    super.initState();
  }

  /// @BUILD
  @override
  Widget build(BuildContext context) {
    //
    /// gets planets for current period
    dat.currentPlanets.clear();
    dat.currentPlanets.addAll(
        planetFor[d[selected].millisecondsSinceEpoch.astroSign][dat.sign]);
    //
    final screen = MediaQuery.of(context).size;

    calculateProphecy();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            //
            /// @APPBAR
            myProphetAppBar(
                width: screen.width,
                label: appBarLabel(selected: selected, dateTime: d[selected]),
                onTap: () {
                  Navigator.pushNamed(context, '/menu');
                }),

            /// @CALENDAR
            Container(
                height: CALENDAR_HEIGHT,
                width: screen.width,
                child: Stack(
                  children: [
                    /// actual calendar
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.calendarBackground.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.calendarShadow.withOpacity(0.34),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ]),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: NUMBER_OF_DAYS_TO_SHOW,
                        itemBuilder: dayToWidget,
                      ),
                    ),
                  ],
                )),

            //

            SizedBox(
              height: SPACE_BETWEEN_CALENDAR_PROPHECY,
              width: screen.width,
            ),

            /// @PROPHECY
            BlocBuilder<ProphecyBloc, ProphecyState>(
              bloc: sp.prophecyBloc,
              builder: prophecyBuilder,
            ),

            SizedBox(
              height: SPACE_BETWEEN_PROPHECY_POLLS,
              width: screen.width,
            ),

            /// @CARDS
            (isToday) ? SizedBox() : notation(text: localeText.futureDays),

            SizedBox(
              height: SPACE_BEFORE_AMBIANCE,
              width: screen.width,
            ),

            /// button that says "ambiance (relationship) are not avaible in this version"
            notAvailableButton(),

            SizedBox(
              height: SPACE_AFTER_AMBIANCE,
              width: screen.width,
            ),
          ],
        ),
      ),
    );
  }
}
