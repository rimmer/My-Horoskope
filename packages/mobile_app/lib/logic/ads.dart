import 'package:my_horoskope/exports_for_main.dart';

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
  AppGlobal.ads.manager = new EmptyAdsManager();
  final androidAppKey = dotenv.env["REPLACE_WITH_ID"];
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

  /**
   * Launches the underlying consent manager dialog of an implemented ad network
   */
  Future<void> askUserConsent();

  /**
   * Initializes the ad network if the consent is given
   */
  void checkConsentGivenAndInit(
    String serviceKey, {
    @required AdsLoadedCallback onLoaded,
    @required AdsWatchedCallback onWatched,
    AdsFailedCallback onFailed,
  });
}
/**
 * The status of a consent given by the user
 * for ad serving
 */
enum ConsentStatus {
  UNKNOWN,
  NON_PERSONALIZED,
  PARTLY_PERSONALIZED,
  PERSONALIZED
}

/**
 * Manages showing ads
 * Empty implementation. Changed from Appodeal implementation
 * to remove ads integration
 *
 * TODO implement other ads provider or remove
 */
class EmptyAdsManager extends AdsManager {
  @override
  Future<void> show() async {}

  @override
  Future<void> askUserConsent() async {}

  void setCallbacks({
    @required AdsLoadedCallback onLoaded,
    @required AdsWatchedCallback onWatched,
    AdsFailedCallback onFailed,
  }) {
    debugPrint('Ads empty implementation. Marking ads as loaded and watched');
    onLoaded();
    onWatched();
    AppGlobal.firebase.analytics.logEvent(name: "ad_watched");
  }

  @override
  void checkConsentGivenAndInit(
    String appKey, {
    @required AdsLoadedCallback onLoaded,
    @required AdsWatchedCallback onWatched,
    AdsFailedCallback onFailed,
  }) async {
    setCallbacks(onLoaded: onLoaded, onWatched: onWatched, onFailed: onFailed);
  }
}
