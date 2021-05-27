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
  //
  final MutableBool notificationsAreDisabled = MutableBool(false);

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

    notificationsAreDisabled.wrapped =
        StaticProvider.data.appPref.dat.notifications.disabled;

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
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationFadeOutController,
          builder: (context, child) => FadeTransition(
            opacity: _animationFadeOut,
            child: child,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: MenuItemLeadingIcon(
                      asset: StaticProvider
                          .data.usersRepo.current.model.birth.astroSign,
                      text:
                          " ${localeText.my.capitalize()} ${localeText.horoscope}",
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, '/daily');
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: NotAvaibleInfo(
                    child: MenuItemLeadingIcon(
                      icon: Icons.group_add,
                      text: "${localeText.addAmbiance.capitalize()}",
                      onTap: null,
                    ),
                    title: localeText.noAmbianceTitle.capitalize(),
                    desc: localeText.noAmbianceDescription,
                    button: localeText.noAmbianceButton.toUpperCase(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: MenuItemLeadingIcon(
                      icon: Icons.perm_identity,
                      text: "${localeText.profileSettings.capitalize()}",
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, '/settings');
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: LanguagePicker(
                      child: MenuItemLeadingIcon(
                    icon: Icons.flag,
                    text: localeText.language.capitalize(),
                    onTap: null,
                  )),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                  ),
                  color: AppColors.primary.withOpacity(0.3),
                  child: SingleChildScrollView(
                    child: MenuItemRateApp(
                        text: "${localeText.rateApp.capitalize()}",
                        onTap: () {
                          LaunchReview.launch(
                            writeReview: false,
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: MenuItemFootingIcon(
                      text: "${localeText.writeToDev.capitalize()}",
                      onTap: () {
                        launch(_WRITE_TO_DEV_URL);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: SwitchableMenuItem(
                    text: localeText.disableNotifications.capitalize(),
                    value: notificationsAreDisabled,
                    onChanged: (bool newVal) {
                      StaticProvider.data.appPref.notifications =
                          NotificationsPreferences(disabled: newVal);
                    },
                  ),
                ),
                SizedBox(height: 40.0),
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
      ),
    );
  }
}
