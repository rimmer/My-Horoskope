import 'package:flutter/material.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:my_horoskope/logic/cards/cards_logic.dart';
import 'package:my_horoskope/widgets/card/big_card/card_with_button.dart';
import 'package:text/text.dart';

class CardsAdsResolver extends StatefulWidget {
  const CardsAdsResolver();

  @override
  _CardsAdsResolverState createState() => _CardsAdsResolverState();
}

class _CardsAdsResolverState extends State<CardsAdsResolver> {
  @override
  Widget build(BuildContext context) {
    AppGlobal.ads.manager.onConsentChanged = () => setState(() {});

    if (AppGlobal.ads.adsConsentNeeded && !AppGlobal.ads.adsConsentGiven) {
      return PredictionCardWithButton(
          text: localeText.adsGiveConcent,
          buttonText: localeText.adsGiveConcentButton.toUpperCase(),
          onButtonTap: adsOnConsent);
    } else if (AppGlobal.ads.adsLoaded) {
      return PredictionCardWithButton(
          text: localeText.adsCardDescription,
          buttonText: localeText.watchAdsButton.toUpperCase(),
          onButtonTap: adsOnAdsAvailable);
    }

    return PredictionCardWithButton(
      text: localeText.adsErrorLoadingText,
      textFontSize: 14,
      buttonText: localeText.adsErrorLoadingButton.toUpperCase(),
      onButtonTap: adsOnNotAvailable,
    );
  }

  adsOnNotAvailable() {
    /// It doesn't send event when no internet, and don't send it on the next start
    /// need to discuss
    // logEventNoInternetForAds();
    CardsLogic.of(context).whenAdsWatched();
  }

  adsOnAdsAvailable() {
    if (!AppGlobal.ads.adsWatched)
      AppGlobal.ads.manager.show().then(
            (_) => CardsLogic.of(context).whenAdsWatched(),
          );
  }

  adsOnConsent() {
    if (AppGlobal.ads.adsConsentNeeded && !AppGlobal.ads.adsConsentGiven)
      AppGlobal.ads.manager.askUserConsent();
    else
      setState(() {});
  }
}
