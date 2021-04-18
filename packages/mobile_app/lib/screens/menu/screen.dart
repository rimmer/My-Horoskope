import 'index.dart';

const _WRITE_TO_DEV_URL = "https://forms.gle/R67F71wPMYEbEWrs7";

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationFadeOutController;
  Animation<double> _animationFadeOut;

  @override
  void initState() {
    _animationFadeOutController = AnimationController(
      duration: Duration(seconds: 3),
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationFadeOutController,
          builder: (context, child) => FadeTransition(
            opacity: _animationFadeOut,
            child: child,
          ),
          child: ListView(
            padding: EdgeInsets.only(
              top: 32.0,
              left: 32.0,
              right: 32.0,
            ),
            scrollDirection: Axis.vertical,
            children: [
              menuItemLeadingIcon(
                  asset: StaticProvider
                      .data.usersRepo.current.model.birth.astroSign,
                  text:
                      " ${localeText.my.capitalize()} ${localeText.horoscope}",
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/daily');
                    });
                  }),
              NotAvaibleInfo(
                child: menuItemLeadingIcon(
                  icon: Icons.group_add,
                  text: "${localeText.addAmbiance.capitalize()}",
                  onTap: null,
                ),
                title: localeText.noAmbianceTitle.capitalize(),
                desc: localeText.noAmbianceDescription,
                button: localeText.noAmbianceButton.toUpperCase(),
              ),
              menuItemLeadingIcon(
                  icon: Icons.perm_identity,
                  text: "${localeText.profileSettings.capitalize()}",
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/settings');
                    });
                  }),
              menuItemFootingIcon(
                  text: "${localeText.writeToDev.capitalize()}",
                  onTap: () {
                    launch(_WRITE_TO_DEV_URL);
                  }),
              SingleChildScrollView(
                child: menuItemRateApp(
                    text: "${localeText.rateApp.capitalize()}",
                    onTap: () {
                      LaunchReview.launch(
                        writeReview: false,
                      );
                    }),
              ),
              SizedBox(height: 50.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: termsText(
                      text: localeText.userAgreement.capitalize(),
                      url: URL_USER_AGREEMENT,
                    ),
                  ),
                  Flexible(
                    child: termsText(
                      text: localeText.privacyPolicy.capitalize(),
                      url: URL_PRIVACY_POLICY,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
