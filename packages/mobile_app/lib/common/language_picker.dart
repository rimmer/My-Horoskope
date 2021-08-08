import 'package:base/cards.dart';
import 'package:flutter/material.dart';
import 'package:my_prophet/common/popup_deprecated.dart';
import 'package:base/preferences/setting/locale/item.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:my_prophet/theme/app_text_style.dart';
import 'package:my_prophet/app_global.dart';
import 'package:my_prophet/logic/localization/locale.dart';

class LanguagePicker extends StatelessWidget {
  final Widget child;

  const LanguagePicker({@required this.child});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showOverCurrentScreen(
          context: context,
          child: SimpleTransperentScreen(
            body: Container(
              height: screen.height,
              width: screen.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 64.0,
              ),
              child: Center(
                child: Container(
                  width: screen.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withOpacity(0.95),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      /// add language options here
                      children: [
                        _LanguageChoise(
                            languageCode: "en", languageName: "English"),
                        _LanguageChoise(
                            languageCode: "ru", languageName: "Русский"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}

class _LanguageChoise extends StatelessWidget {
  final String languageCode;
  final String languageName;

  const _LanguageChoise({
    @required this.languageCode,
    @required this.languageName,
  });

  _languageChoise(BuildContext context) async {
    AppGlobal.data.appPref.locale = LocaleSettings(language: languageCode);

    await chooseLocale();

    bool adsWatched = Cards().adsWatched;
    Cards().restart();
    Cards().adsWatched = adsWatched;

    Navigator.pushNamed(context, '/daily');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _languageChoise(context);
      },
      child: Text(
        languageName,
        style: AppTextStyle.menuItem,
      ),
    );
  }
}
