import 'package:appodeal_flutter/appodeal_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Ad successfully received and ready to be shown
/// Call [AdWithoutView.show()] to show the ad
typedef AdsLoadedCallback = void Function();

/// Ad has been displayed and next action can be performed
typedef AdsWatchedCallback = void Function();

/// Something went wrong with the ad
typedef AdsFailedCallback = void Function(String error);

Future<void> initAds({
  @required AdsLoadedCallback onLoaded,
  @required AdsWatchedCallback onWatched,
  AdsFailedCallback onFailed,
}) async {
  //
  AppGlobal.ads.manager = new AppodealAdsManager();
  final androidAppKey = dotenv.env["appodeal_android_id"];
  Appodeal.setAppKeys(androidAppKey: androidAppKey);
  Appodeal.setInterstitialCallback((event) {
    switch (event) {
      case "onInterstitialLoaded":
        debugPrint('Ad loaded.');
        AppGlobal.firebase.analytics.logEvent(name: "ad_loaded");
        onLoaded();
        break;
      case "onInterstitialFailedToLoad":
        AppGlobal.firebase.analytics.logEvent(name: "ad_failed_load");
        debugPrint('Ad failed to load');
        if (onFailed != null) onFailed(event);
        break;
      case "onInterstitialShowFailed":
        AppGlobal.firebase.analytics.logEvent(name: "ad_failed_show");
        debugPrint('Ad failed to show');
        if (onFailed != null) onFailed(event);
        break;
      case "onInterstitialClosed":
        debugPrint('Ad closed.');
        AppGlobal.firebase.analytics.logEvent(name: "ad_watched");
        onWatched();
        break;
      case "onInterstitialShown":
        debugPrint('Ad opened.');
        AppGlobal.firebase.analytics.logEvent(name: "ad_opened");
        break;
      case "onInterstitialClicked":
        debugPrint('Ad clicked.');
        AppGlobal.firebase.analytics.logEvent(name: "ad_clicked");
        break;
      // case "onInterstitialExpired":
    }
  });

  await checkConsentGivenAndInit();

  // we'd like tp cache ads right here
  await Appodeal.cache(AdType.INTERSTITIAL);
}

Future<void> checkConsentGivenAndInit() async {
  // only do the check if concent is required
  AppGlobal.ads.adsConsentNeeded = await Appodeal.shouldShowConsent();

  if (AppGlobal.ads.adsConsentNeeded) {
    // check if the user already gave their consent
    final consent = await Appodeal.fetchConsentInfo();
    AppGlobal.ads.adsConsentGiven =
        consent.status == ConsentStatus.PERSONALIZED ||
            consent.status == ConsentStatus.PARTLY_PERSONALIZED;
  } else {
    AppGlobal.ads.adsConsentGiven = true;
  }

  AppGlobal.firebase.analytics.setUserProperty(
      name: "ads_consent_given",
      value: AppGlobal.ads.adsConsentGiven.toString());

  // if not, we will initialize again later when consent will be asked
  return Appodeal.initialize(
    hasConsent: AppGlobal.ads.adsConsentGiven,
    adTypes: [AdType.INTERSTITIAL], // we need only INTERSTITIAL
    testMode: AppGlobal.debug.isDebug,
    verbose: AppGlobal.debug.isDebug,
  );
}

/**
 * Abstraction responsible for showing ads
 */
abstract class AdsManager {
  /**
   * Triggers showing the INTERSTITIAL ad
   */
  Future<void> show();

  Future<void> askUserConcent();
}

/**
 * Implementation for Appodeal
 * Manages showing ads
 */
class AppodealAdsManager extends AdsManager {
  @override
  Future<void> show() => Appodeal.show(AdType.INTERSTITIAL);

  @override
  Future<void> askUserConcent() {
    return Appodeal.requestConsentAuthorization();
  }
}
