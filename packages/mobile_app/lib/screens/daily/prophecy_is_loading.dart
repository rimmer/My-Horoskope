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
          "",
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
              Text("  ", style: AppTextStyle.normalText),
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
                  ),
                ),
                //

                Center(
                  child: SpinKitWave(color: AppColors.accent),
                ),
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
