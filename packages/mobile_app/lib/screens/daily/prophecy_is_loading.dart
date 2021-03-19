import 'screen/index.dart';

ListView prophecyIsLoading() {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    children: <Widget>[
      /// {NAME} {ROLE}
      Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
        ),
        child: Text(
          "-.-.-.-.-.-.-.-.-",
          style: AppTextStyle.userName,
        ),
      ),

      /// {Astrosign} {Birthdate}
      Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          bottom: 8.0,
        ),
        child: SizedBox(
          height: 32,
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/icons/Moon.svg"),
              Text(" 11.11.2011 ", style: AppTextStyle.normalText),
            ],
          ),
        ),
      ),

      /// Prophecy Sheet
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 4.0,
        ),

        /// Background gradient
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.prophecyGradientStart.withOpacity(0.9),
                AppColors.prophecyGradientEnd.withOpacity(0.9),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(8.0)),

        /// main list view
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            /// prophecies listview
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                left: PROPHECY_PADDING_HORIZONTAL,
                right: PROPHECY_PADDING_HORIZONTAL,
                bottom: 12.0,
              ),
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                /// yourProphecies title and notation
                Padding(
                  padding: const EdgeInsets.only(
                    left: 3.0,
                    bottom: 8.0,
                  ),
                  child: TitleWithDescription(
                    title: localeText.yourProphecies.capitalize(),
                    notation: localeText.yourPropheciesHint,
                    height: 176.0,
                    width: 250.0,
                  ),
                ),
                //

                prophecyRecordLoading(
                    prophecyName: ProphecyType.INTERNAL_STRENGTH.toStr),
                prophecyRecordLoading(prophecyName: ProphecyType.MOODLET.toStr),
                prophecyRecordLoading(
                    prophecyName: ProphecyType.AMBITION.toStr),
                prophecyRecordLoading(
                    prophecyName: ProphecyType.INTUITION.toStr),
                prophecyRecordLoading(prophecyName: ProphecyType.LUCK.toStr),
              ],
            ),

            //
            prophecySheetDivider(),

            /// planet impact
            ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: PROPHECY_PADDING_HORIZONTAL),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                      left: 3.0,
                    ),
                    child: TitleWithDescription(
                      title: localeText.impact.capitalize(),
                      notation: localeText.impactHint,
                      height: 172.0,
                      width: 242.0,
                    ),
                  ),
                  Container(
                    height: 32.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(" ${localeText.planetImpactName['Lilith']} "),
                            SvgPicture.asset("assets/icons/Lilith.svg",
                                color: AppColors.textDisabled),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" ${localeText.planetImpactName['Selene']} "),
                            SvgPicture.asset("assets/icons/Selene.svg",
                                color: AppColors.textDisabled),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),

            // @TODO
          ],
        ),
      ),
    ],
  );
}

Padding prophecyRecordLoading({
  @required String prophecyName,
}) {
  //

  /// any value
  final value = 42.0;
  final valuePercent = value / 100;

  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 6.0,
      horizontal: 2.0,
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            localeText.prophecyId[prophecyName],
            style: AppTextStyle.prophecyLabel,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${value.toStringAsFixed(0)}%",
              style: AppTextStyle.prophecyPercent,
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0),
              height: 4.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.prophecyValueProgressGradientBorder),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                gradient: LinearGradient(colors: [
                  AppColors.prophecyValueProgressGradient[0],
                  AppColors.prophecyValueProgressGradient[1],
                  AppColors.prophecyValueProgressGradient[2],
                  AppColors.prophecyValueProgressGradient[3],
                  AppColors.prophecyValueProgressGradient[4],
                  AppColors.prophecyValueProgressGradient[5],
                  AppColors.prophecyValueProgressGradient[6],
                  AppColors.prophecyValueProgressGradient[7],
                  AppColors.prophecyValueProgressGradient[8],
                  AppColors.prophecyValueProgressGradient[8],
                  Colors.transparent
                ], stops: [
                  0.0,
                  0.1,
                  (valuePercent > 0.3) ? 0.3 : valuePercent,
                  (valuePercent > 0.4) ? 0.4 : valuePercent,
                  (valuePercent > 0.5) ? 0.5 : valuePercent,
                  (valuePercent > 0.6) ? 0.6 : valuePercent,
                  (valuePercent > 0.7) ? 0.7 : valuePercent,
                  (valuePercent > 0.8) ? 0.8 : valuePercent,
                  (valuePercent > 0.9) ? 0.9 : valuePercent,
                  (valuePercent > 1.0) ? 1.0 : valuePercent,
                  valuePercent,
                ]),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
