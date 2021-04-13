import 'package:my_prophet/components/user_settings/index.dart';

import 'common.dart';
import 'package:my_prophet/theme/app_colors.dart';
import '../gradient_border_button.dart';

class BigCardAds extends StatefulWidget {
  @override
  _BigCardAdsState createState() => _BigCardAdsState();
}

class _BigCardAdsState extends State<BigCardAds> {
  SingleProvider _sp;

  @override
  void initState() {
    _sp = context.read<SingleProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: StaticAsset.rust["card_placeholder"],
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        padding: EdgeInsets.only(
          top: 16.0,
        ),
        scrollDirection: Axis.vertical,
        children: [
          Text(
            localeText.adsCardDescription,
            style: AppTextStyle.bigCardText,
          ),
          SizedBox(
            height: 16.0,
          ),
          gradientBorderButton(
            child: Text(
              localeText.watchAdsButton.toUpperCase(),
              style: AppTextStyle.normalText,
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.accentDark,
                AppColors.accent,
                AppColors.primary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderAsPadding: EdgeInsets.all(1.0),
            background: AppColors.primaryDark,
            internalPadding:
                EdgeInsets.symmetric(horizontal: 38, vertical: 12.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            onPressed: () {
              _sp.ads.watched = true;
              _sp.ads.whenWatched();
            },
          ),
        ],
      ),
    );
  }
}
