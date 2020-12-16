import '../index.dart';

const _BOTTOM_ROW_HEIGHT = 80.0;
const _WRITE_TO_DEV_URL = "https://forms.gle/R67F71wPMYEbEWrs7";

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  SingleProvider sp;

  @override
  void initState() {
    sp = context.read<SingleProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: screen.height - _BOTTOM_ROW_HEIGHT,
            padding: EdgeInsets.only(
              top: 32.0,
              left: 32.0,
              right: 32.0,
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                menuItemLeadingIcon(
                    asset: sp.usersRepo.current.model.birth.astroSign,
                    text: " ${lang.my.capitalize()} ${lang.horoscope}",
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, '/daily');
                      });
                    }),
                NotAvaibleInfo(
                  height: 242,
                  width: 250,
                  child: menuItemLeadingIcon(
                    icon: Icons.group_add,
                    text: "${lang.addAmbiance.capitalize()}",
                    onTap: null,
                  ),
                  title: lang.noAmbianceTitle.capitalize(),
                  desc: lang.noAmbianceDescription,
                  button: lang.noAmbianceButton.toUpperCase(),
                ),
                menuItemLeadingIcon(
                    icon: Icons.perm_identity,
                    text: "${lang.profileSettings.capitalize()}",
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, '/settings');
                      });
                    }),
                PollSettings(
                  child: menuItemLeadingIcon(
                    icon: Icons.info_outline,
                    text: "${lang.pollSettingsTitle.capitalize()}",
                    onTap: null,
                  ),
                ),
                menuItemFootingIcon(
                    text: "${lang.writeToDev.capitalize()}",
                    onTap: () {
                      launch(_WRITE_TO_DEV_URL);
                    }),
                menuItemRateApp(
                    text: "${lang.rateApp.capitalize()}",
                    onTap: () {
                      LaunchReview.launch();
                    }),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: termsText(
                    text: lang.userAgreement.capitalize(),
                    url: URL_USER_AGREEMENT,
                  ),
                ),
                Flexible(
                  child: termsText(
                    text: lang.privacyPolicy.capitalize(),
                    url: URL_PRIVACY_POLICY,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
