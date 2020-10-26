import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/single_provider.dart';
import 'package:app/components/accept_terms_text.dart';

import 'menu_items.dart';

const BOTTOM_ROW_HEIGHT = 80.0;
const MENU_WIDTH_MULTIPLIER = 8 / 10;

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
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Container(
        color: AppColors.primaryDark,
        height: screen.height,
        width: screen.width * MENU_WIDTH_MULTIPLIER,
        child: Column(
          children: [
            Container(
              height: screen.height - BOTTOM_ROW_HEIGHT,
              width: screen.width * MENU_WIDTH_MULTIPLIER,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 32.0,
                      left: 32.0,
                    ),
                    child: Column(
                      children: [
                        menuItemLeadingIcon(
                            asset: sp.usersRepo.current.model.birth.astroSign,
                            text: " ${lang.my.capitalize()} ${lang.horoscope}",
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, '/daily');
                              });
                            }),
                        menuItemLeadingIcon(
                            icon: Icons.group_add,
                            text: "${lang.addAmbiance.capitalize()}",
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, '/daily');
                              });
                            }),
                        menuItemLeadingIcon(
                            icon: Icons.perm_identity,
                            text: "${lang.profileSettings.capitalize()}",
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, '/daily');
                              });
                            }),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.primary.withOpacity(0.4),
                    padding: EdgeInsets.only(
                      top: 16.0,
                      left: 32.0,
                      right: 32.0,
                      bottom: 16.0,
                    ),
                    child: Column(
                      children: [
                        menuItemFootingIcon(
                            icon: Icons.border_color,
                            text: "${lang.notification.capitalize()}",
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, '/daily');
                              });
                            }),
                        menuItemFootingIcon(
                            icon: Icons.info_outline,
                            text: "${lang.pollSettingsTitle.capitalize()}",
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, '/daily');
                              });
                            }),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 32.0,
                      right: 32.0,
                    ),
                    child: Column(
                      children: [
                        menuItemFootingIcon(
                            text: "${lang.writeToDev.capitalize()}",
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, '/daily');
                              });
                            }),
                        menuItemRateApp(
                            text: "${lang.rateApp.capitalize()}",
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, '/daily');
                              });
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screen.width * MENU_WIDTH_MULTIPLIER,
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
        ),
      )),
    );
  }
}
