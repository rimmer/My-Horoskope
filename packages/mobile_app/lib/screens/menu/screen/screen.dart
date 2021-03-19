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
                    text:
                        " ${localeText.my.capitalize()} ${localeText.horoscope}",
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
                menuItemRateApp(
                    text: "${localeText.rateApp.capitalize()}",
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
          ),
        ],
      )),
    );
  }
}
