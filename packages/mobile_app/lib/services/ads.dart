import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_prophet/index.dart';

/// Ad successfully received and ready to be shown
/// Call [AdWithoutView.show()] to show the ad
typedef AdsLoadedCallback = void Function(AdWithoutView ad);

/// Ad has been displayed and next action can be performed
typedef AdsWatchedCallback = void Function();

/// Something went wrong with the ad loading
typedef AdsFailedCallback = void Function(LoadAdError error);

AdWithoutView getAdsManager(
        {@required AdsLoadedCallback onLoaded,
        @required AdsWatchedCallback onWatched,
        @required AdsFailedCallback onFailed,
        bool isDebug = false}) =>
    InterstitialAd(
      adUnitId: StaticProvider.ads.adUnitId,
      request: AdRequest(),
      listener: AdListener(onAdLoaded: (Ad ad) {
        // Ad is successfully received.
        onLoaded(ad);
        if (isDebug) print('Ad loaded.');
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Ad request failed.
        onFailed(error);
        ad.dispose();
        if (isDebug) print('Ad failed to load: $error');
      }, onAdOpened: (Ad ad) {
        // Ad opens an overlay that covers the screen.
        if (isDebug) print('Ad opened.');
      }, onAdClosed: (Ad ad) {
        // Ad removes an overlay that covers the screen.
        onWatched();
        ad.dispose();
        if (isDebug) print('Ad closed.');
      }, onApplicationExit: (Ad ad) {
        // Ad is in the process of leaving the application.
        if (isDebug) print('Left application.');
      }),
    );
