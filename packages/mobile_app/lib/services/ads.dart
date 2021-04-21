import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

AdWithoutView getCardAd(
        {@required Function whenAdsWatched, bool isDebug = false}) =>
    InterstitialAd(
      adUnitId: 'ca-app-pub-4088776870080587/3604438949',
      request: AdRequest(),
      listener: AdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) {
        if (isDebug) print('Ad loaded.');
      },
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
        whenAdsWatched();
        ad.dispose();
        if (isDebug) print('Ad failed to load: $error');
      },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) {
        if (isDebug) print('Ad opened.');
      },
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) {
        whenAdsWatched();
        ad.dispose();
        if (isDebug) print('Ad closed.');
      },
          // Called when an ad is in the process of leaving the application.
          onApplicationExit: (Ad ad) {
        if (isDebug) print('Left application.');
      }, onRewardedAdUserEarnedReward: (Ad ad, _) {
        whenAdsWatched();
      }),
    );
