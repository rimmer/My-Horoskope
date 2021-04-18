part of 'static_provider.dart';

AdWithoutView getCardAd() => InterstitialAd(
      adUnitId: 'ca-app-pub-4088776870080587/3604438949',
      request: AdRequest(),
      listener: AdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          if (StaticProvider.debug.isDebug) print('Ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          Cards().whenAdsWatched();
          if (StaticProvider.debug.isDebug) print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {
          if (StaticProvider.debug.isDebug) print('Ad opened.');
        },
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {
          ad.dispose();
          Cards().whenAdsWatched();
          if (StaticProvider.debug.isDebug) print('Ad closed.');
        },
        // Called when an ad is in the process of leaving the application.
        onApplicationExit: (Ad ad) {
          if (StaticProvider.debug.isDebug) print('Left application.');
        },
      ),
    );
