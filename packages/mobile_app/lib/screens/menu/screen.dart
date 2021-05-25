import 'index.dart';
import 'package:my_prophet/services/local_notifications.dart';

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
      floatingActionButton: IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () async {
          await timeoutNotification(
            body: "Today is a good day for a dance.",
            channelInfo: StaticProvider.notifications.reminderChannel,
            timeout: Duration(seconds: 10),
          );
        },
      ),
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
              MenuItemLeadingIcon(
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
                child: MenuItemLeadingIcon(
                  icon: Icons.group_add,
                  text: "${localeText.addAmbiance.capitalize()}",
                  onTap: null,
                ),
                title: localeText.noAmbianceTitle.capitalize(),
                desc: localeText.noAmbianceDescription,
                button: localeText.noAmbianceButton.toUpperCase(),
              ),
              MenuItemLeadingIcon(
                  icon: Icons.perm_identity,
                  text: "${localeText.profileSettings.capitalize()}",
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/settings');
                    });
                  }),
              LanguagePicker(
                  child: MenuItemLeadingIcon(
                icon: Icons.flag,
                text: localeText.language.capitalize(),
                onTap: null,
              )),
              MenuItemFootingIcon(
                  text: "${localeText.writeToDev.capitalize()}",
                  onTap: () {
                    launch(_WRITE_TO_DEV_URL);
                  }),
              SingleChildScrollView(
                child: MenuItemRateApp(
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
                    child: TermsText(
                      text: localeText.userAgreement.capitalize(),
                      url: URL_USER_AGREEMENT,
                    ),
                  ),
                  Flexible(
                    child: TermsText(
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
