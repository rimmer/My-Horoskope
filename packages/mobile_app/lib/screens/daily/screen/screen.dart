import 'package:app/routes.dart';

/// all imports are here
import 'index.dart';

/// keeps it simple
part 'builders.dart';
part 'data.dart';

class DailyScreen extends StatefulWidget {
  /// current widget state data
  final dat = DailyStateData();

  /// current and next NUMBER_OF_DAYS_TO_SHOW days DateTime
  final List<DateTime> day = [];

  /// current day to show index
  final currentIndex = MutableInteger(0);

  DailyScreen() {
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
  DailyStateData get dat => widget.dat;

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
    dat.currentPlanets
      ..clear()
      ..addAll(
          planetFor[d[selected].millisecondsSinceEpoch.astroSign][dat.sign]);
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
            Container(
              color: AppColors.appBarBackground,
              height: APPBAR_HEIGHT,
              width: screen.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: SizedBox(width: APPBAR_ICON_SIZE / 3)),
                  Flexible(
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.textDisabled,
                        size: APPBAR_ICON_SIZE,
                      ),
                      onPressed: () {
                        /// @TODO
                        print("Hello there!");
                      },
                    ),
                  ),
                  Flexible(child: SizedBox(width: APPBAR_BETWEEN_ICON_TEXT)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      appBarLabel(selected: selected, dateTime: d[selected]),
                      style: TextStyle(
                        fontSize: APPBAR_FONT_SIZE,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
              height: screen.height,
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
          ],
        ),
      ),
    );
  }
}
