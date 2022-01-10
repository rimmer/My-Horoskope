import 'package:flutter/widgets.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';
import 'package:my_horoskope/app_global.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Ad successfully received and ready to be shown
/// Call [AdWithoutView.show()] to show the ad
typedef AdsLoadedCallback = void Function();

/// Ad has been displayed and next action can be performed
typedef AdsWatchedCallback = void Function();

/// Something went wrong with the ad
typedef AdsFailedCallback = void Function(String error);

/// User consent status changed
typedef OnConsentChangedCallback = void Function();

Future<void> initAds({
  @required AdsLoadedCallback onLoaded,
  @required AdsWatchedCallback onWatched,
  AdsFailedCallback onFailed,
}) async {
  //
  AppGlobal.ads.manager = new AppodealAdsManager();
  final androidAppKey = dotenv.env["appodeal_android_id"];
  AppGlobal.ads.manager.checkConsentGivenAndInit(androidAppKey,
      onLoaded: onLoaded, onWatched: onWatched, onFailed: onFailed);
}

/**
 * Abstraction responsible for showing ads
 */
abstract class AdsManager {
  OnConsentChangedCallback onConsentChanged;

  /**
   * Triggers showing the INTERSTITIAL ad
   */
  Future<void> show();

  Future<void> askUserConcent();

  void checkConsentGivenAndInit(
    String serviceKey, {
    @required AdsLoadedCallback onLoaded,
    @required AdsWatchedCallback onWatched,
    AdsFailedCallback onFailed,
  });
}

/**
 * Implementation for Appodeal
 * Manages showing ads
 */
class AppodealAdsManager extends AdsManager {
  @override
  Future<void> show() => Appodeal.show(Appodeal.INTERSTITIAL);

  @override
  Future<void> askUserConcent() {
    return ConsentManager.showAsActivityConsentForm();
  }

  void setCallbacks({
    @required AdsLoadedCallback onLoaded,
    @required AdsWatchedCallback onWatched,
    AdsFailedCallback onFailed,
  }) {
    Appodeal.setLogLevel(Appodeal.LogLevelDebug);
    Appodeal.setInterstitialCallbacks((onInterstitialLoaded, isPrecache) {
      debugPrint('Ad loaded.');
      AppGlobal.firebase.analytics.logEvent(name: "ad_loaded");
      onLoaded();
    }, (onInterstitialFailedToLoad) {
      AppGlobal.firebase.analytics.logEvent(name: "ad_failed_load");
      debugPrint('Ad failed to load');
      // assuming `onInterstitialShowFailed` has the error code
      // which I'm not sure :)
      if (onFailed != null) onFailed(onInterstitialFailedToLoad);
    }, (onInterstitialShown) {
      debugPrint('Ad opened.');
      AppGlobal.firebase.analytics.logEvent(name: "ad_opened");
    }, (onInterstitialShowFailed) {
      AppGlobal.firebase.analytics.logEvent(name: "ad_failed_show");
      debugPrint('Ad failed to show');
      // assuming `onInterstitialShowFailed` has the error code
      // which I'm not sure :)
      if (onFailed != null) onFailed(onInterstitialShowFailed);
    }, (onInterstitialClicked) {
      debugPrint('Ad clicked.');
      AppGlobal.firebase.analytics.logEvent(name: "ad_clicked");
    }, (onInterstitialClosed) {
      debugPrint('Ad closed.');
      AppGlobal.firebase.analytics.logEvent(name: "ad_watched");
      onWatched();
    }, (onInterstitialExpired) {});
  }

  Future<Status> _populateAndReturnConsentStatus() {
    return ConsentManager.getConsentStatus().then((status) {
      AppGlobal.ads.adsConsentGiven =
          [Status.PARTLY_PERSONALIZED, Status.PERSONALIZED].contains(status);
      // if status is `UNKNOWN`, we have to ask again

      AppGlobal.firebase.analytics.setUserProperty(
          name: "ads_consent_given",
          value: AppGlobal.ads.adsConsentGiven.toString());

      debugPrint('Ads consent given: ${AppGlobal.ads.adsConsentGiven}');
      return status;
    });
  }

  @override
  void checkConsentGivenAndInit(
    String appKey, {
    @required AdsLoadedCallback onLoaded,
    @required AdsWatchedCallback onWatched,
    AdsFailedCallback onFailed,
  }) async {
    setCallbacks(onLoaded: onLoaded, onWatched: onWatched, onFailed: onFailed);
    ConsentManager.setConsentInfoUpdateListener(
        (onConsentInfoUpdated, consent) async {
      final status = await _populateAndReturnConsentStatus();

      // we don't need to ask consent if it the user has decided
      if (status == Status.UNKNOWN) {
        AppGlobal.ads.adsConsentNeeded = false;
      } else {
        final shouldShow = await ConsentManager.shouldShowConsentDialog();
        // only do the check if concent is required
        AppGlobal.ads.adsConsentNeeded = shouldShow == ShouldShow.TRUE;

        debugPrint('Ads consent needed: $shouldShow');

        if (AppGlobal.ads.adsConsentNeeded) {
          ConsentManager.loadConsentForm();
        }
      }

      // if we need to ask consent, we will init later when the user decides
      if (!AppGlobal.ads.adsConsentNeeded) {
        Appodeal.initialize(
          appKey,
          [Appodeal.INTERSTITIAL], // we need only INTERSTITIAL
          AppGlobal.ads.adsConsentGiven,
        );
      }
    },
        (onFailedToUpdateConsentInfo, error) =>
            debugPrint('Error requesting consent info with the error: $error'));

    ConsentManager.requestConsentInfoUpdate(appKey);
    debugPrint('Ads consent info requested');

    ConsentManager.setConsentFormListener(
        (onConsentFormLoaded) => {},
        (onConsentFormError, error) => {},
        (onConsentFormOpened) => {}, (onConsentFormClosed, consent) async {
      // if status UNLNOWN, ask again later on other app launch
      final status = await _populateAndReturnConsentStatus();
      if (status == Status.UNKNOWN) {
        AppGlobal.ads.adsConsentNeeded = false;
      }

      if (AppGlobal.ads.adsConsentGiven || status == Status.UNKNOWN) {
        Appodeal.initialize(
          appKey,
          [Appodeal.INTERSTITIAL], // we need only INTERSTITIAL
          AppGlobal.ads.adsConsentGiven,
        );
      }
    });
  }
}
