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

AdWithoutView getAdsManager({
  @required AdsLoadedCallback onLoaded,
  @required AdsWatchedCallback onWatched,
  @required AdsFailedCallback onFailed,
}) =>
    InterstitialAd(
      adUnitId: StaticProvider.ads.adUnitId,
      request: AdRequest(),
      listener: AdListener(onAdLoaded: (Ad ad) {
        // Ad is successfully received.
        onLoaded(ad);
        debugPrint('Ad loaded.');
        StaticProvider.firebase.analytics.logEvent(name: "ad_loaded");
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Ad request failed.
        onFailed(error);
        ad.dispose();
        StaticProvider.firebase.analytics.logEvent(
            name: "ad_failed",
            parameters: {
              'error_message': error.message,
              'error_code': error.code
            });
        debugPrint('Ad failed to load: $error');
      }, onAdOpened: (Ad ad) {
        // Ad opens an overlay that covers the screen.
        debugPrint('Ad opened.');
        StaticProvider.firebase.analytics.logEvent(name: "ad_opened");
      }, onAdClosed: (Ad ad) {
        // Ad removes an overlay that covers the screen.
        onWatched();
        ad.dispose();
        debugPrint('Ad closed.');
        StaticProvider.firebase.analytics.logEvent(name: "ad_watched");
      }, onApplicationExit: (Ad ad) {
        // Ad is in the process of leaving the application.
        debugPrint('Left application.');
      }),
    );
