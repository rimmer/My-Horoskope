import 'index.dart';

const _WRITE_TO_DEV_URL = "https://forms.gle/R67F71wPMYEbEWrs7";

class MenuScreen extends StatelessWidget {
  const MenuScreen();

  @override
  Widget build(BuildContext context) {
    final MutableBool notificationsAreDisabled = MutableBool(false);
    notificationsAreDisabled.wrapped =
        AppGlobal.data.appPref.dat.notifications.disabled;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: const AppBackground(),
          ),
          Positioned.fill(
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(
                  top: 32.0,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: MenuItemLeadingIcon(
                        asset: AppGlobal
                            .data.usersRepo.current.model.birth.astroSign,
                        text:
                            " ${localeText.my.capitalize()} ${localeText.horoscope}",
                        onTap: () {
                          Navigator.pushNamed(context, '/daily');
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
                          Navigator.pushNamed(context, '/settings');
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
                      onChanged: (bool disabled) {
                        AppGlobal.firebase.analytics.logEvent(
                          name: disabled
                              ? "notifications_disabled"
                              : "notifications_enabled",
                          parameters: {},
                        );
                        AppGlobal.data.appPref.notifications =
                            NotificationsPreferences(disabled: disabled);
                      },
                    ),
                  ),
                  const SizedBox(height: 40.0),
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
        ],
      ),
    );
  }
}
