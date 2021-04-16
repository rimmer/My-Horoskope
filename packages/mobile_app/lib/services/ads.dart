part of 'static_provider.dart';

class _AdsService {
  RewardedAd cardAd;

  initCardAd() => cardAd = RewardedAd(
        adUnitId: 'ca-app-pub-3940256099942544/5354046379',
        request: AdRequest(),
        listener: AdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) {
            if (StaticProvider.debug.isDebug) print('Ad loaded.');
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            if (StaticProvider.debug.isDebug)
              print('Ad failed to load: $error');
          },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) {
            if (StaticProvider.debug.isDebug) print('Ad opened.');
          },
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) {
            ad.dispose();
            if (StaticProvider.debug.isDebug) print('Ad closed.');
          },
          // Called when an ad is in the process of leaving the application.
          onApplicationExit: (Ad ad) {
            if (StaticProvider.debug.isDebug) print('Left application.');
          },
          // Called when a RewardedAd triggers a reward.
          onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
            final cards = Cards();
            cards.whenAdsWatched();
          },
        ),
      );
}
