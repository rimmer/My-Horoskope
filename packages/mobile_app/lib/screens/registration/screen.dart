import 'index.dart';

class RegistrationScreen extends StatefulWidget {
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

  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  SingleProvider sp;
  AnimationController _animationFadeOutController;
  Animation<double> _animationFadeOut;

  @override
  void initState() {
    /// getting single provider
    sp = context.read<SingleProvider>();

    _animationFadeOutController = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    )..forward();

    _animationFadeOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationFadeOutController,
      curve: Curves.ease,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _animationFadeOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Listener(
          onPointerUp: (_) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild.unfocus();
            }
          },
          child: SafeArea(
            child: AnimatedBuilder(
              animation: _animationFadeOutController,
              builder: (context, child) => FadeTransition(
                opacity: _animationFadeOut,
                child: child,
              ),
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
                    name: widget.name,
                    month: widget.month,
                    day: widget.day,
                    year: widget.year,
                    sex: widget.sex,
                    indexToSex: widget.indexToSex,
                    termsAccepted: widget.termsAccepted,
                    validInformationCheck: () {
                      if (widget.name.wrapped.isEmpty) {
                        showOverCurrentScreen(
                          context: context,
                          child: wrongInformation(localeText.nameNotFilled),
                        );
                        return false;
                      }
                      if (widget.day.wrapped.isEmpty ||
                          widget.month.wrapped.isEmpty ||
                          widget.year.wrapped.isEmpty ||
                          int.parse(widget.year.wrapped) > upperYearBound(12) ||
                          int.parse(widget.year.wrapped) < 1921 ||
                          int.parse(widget.month.wrapped) > 12 ||
                          int.parse(widget.month.wrapped) < 1 ||
                          int.parse(widget.day.wrapped) > 31 ||
                          int.parse(widget.day.wrapped) < 1) {
                        showOverCurrentScreen(
                          context: context,
                          child: wrongInformation(localeText.dateNotFilled),
                        );
                        return false;
                      }
                      return true;
                    },
                    onUnvalidTerms: () {
                      showOverCurrentScreen(
                          context: context,
                          child:
                              wrongInformation(localeText.termsAreNotAccepted));
                    },
                    onValidInformation: () {
                      sp.authBloc.add(AuthEvent(UserModel(
                        name: widget.name.wrapped,
                        birth: DateTime.utc(
                          int.parse(widget.year.wrapped),
                          int.parse(widget.month.wrapped),
                          int.parse(widget.day.wrapped),
                        ).millisecondsSinceEpoch,
                        sex: widget.sex.wrapped,
                      )));
                    },
                    buttonText: localeText.start.toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
