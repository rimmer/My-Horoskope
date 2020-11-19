/// all imports are here
import 'index.dart';

/// keeps it simple
part 'builders.dart';
part 'data.dart';

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
  void initState() {
    sp = context.read<SingleProvider>();
    //

    dat.user = sp.usersRepo.current;
    dat.labelStr =
        "${dat.user.model.name.capitalize()} (${userRole(dat.user.role)})";
    dat.sign = dat.user.model.birth.astroSign;
    dat.userPatron = dat.user.model.birth.astroHousePlanet;

    final dtConverted = dat.user.model.birth.toDateTime;

    dat.birthRow = Row(
      children: <Widget>[
        SvgPicture.asset("assets/icons/${dat.sign}.svg"),
        Text(" ${dtConverted.day}.${dtConverted.month}.${dtConverted.year} ",
            style: TextStyle(fontSize: 14)),
      ],
    );

    calculateProphecy();

    super.initState();
  }

  List<DateTime> get d => widget.day;
  int get selected => widget.currentIndex.wrapped;
  EnabledProphecies get toShow => sp.show.enabledProphecies;

  void calculateProphecy() {
    sp.prophecyBloc.add(CalculateProphecy(d[selected].millisecondsSinceEpoch));
  }

  void startUserPollBloc() {
    sp.userPollBloc.add(UserPollRestartEvent());
  }

  @override
  Widget build(BuildContext context) {
    //
    /// gets planets for current period
    dat.currentPlanets =
        planetFor[d[selected].millisecondsSinceEpoch.astroSign][dat.sign];
    //
    final screen = MediaQuery.of(context).size;
    bool isToday = d[selected].millisecondsSinceEpoch == dtDay;

    if (isToday) startUserPollBloc();
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
              color: AppColors.calendarBackground.withOpacity(0.4),
              height: CALENDAR_HEIGHT,
              width: screen.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: NUMBER_OF_DAYS_TO_SHOW,
                itemBuilder: dayToWidget,
              ),
            ),

            //

            SizedBox(
              height: SPACE_BETWEEN_CALENDAR_POLLS,
              width: screen.width,
            ),

            /// @USERPOLL
            (isToday)
                ? BlocBuilder<UserPollBloc, UserPollState>(
                    bloc: sp.userPollBloc,
                    builder: userPollBuilder,
                  )
                : SizedBox(),

            SizedBox(
              height: SPACE_BETWEEN_POLLS_PROPHECY,
              width: screen.width,
            ),

            /// @PROPHECY
            SizedBox(
              height: screen.height - 24.0,
              width: screen.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: PROPHECY_PADDING_HORIZONTAL),
                child: BlocBuilder<ProphecyBloc, ProphecyState>(
                  bloc: sp.prophecyBloc,
                  builder: prophecyBuilder,
                ),
              ),
            ),

            NotAvaibleInfo(
              height: 242,
              width: 250,
              child: gradientBorderButton(
                child: Text(
                  lang.addAmbiance.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14.0,
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
                borderAsPadding: EdgeInsets.all(1.0),
                background: AppColors.primaryDark,
                internalPadding:
                    EdgeInsets.symmetric(horizontal: 38, vertical: 12.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                onPressed: null,
              ),
              title: lang.noAmbianceTitle.capitalize(),
              desc: lang.noAmbianceDescription,
              button: lang.noAmbianceButton.toUpperCase(),
            ),

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
